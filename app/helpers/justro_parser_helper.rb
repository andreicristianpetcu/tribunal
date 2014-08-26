require 'savon'

module JustroParserHelper

  def self.get_soap_client
    @@meetings_soap_client = Savon.client(wsdl: 'http://portalquery.just.ro/query.asmx?WSDL')
  end

  def self.find_meeting(court_name, request_date)
    get_soap_client.call(:cautare_sedinte, message: {institutie: court_name, dataSedinta: request_date})
  end

  def self.get_justro_meetings
    JustroMeetingRequestParam.get_notstarted.each do |request_params|
      binding.pry
      request_params.status = "started"
      request_params.save
      break if is_parsing_time_over
      puts "Request meeting for #{request_params.inspect}"
      begin
        court_name = request_params.court_name, 
        meeting_date = request_params.meeting_date
        response = find_meeting(court_name, meeting_date)
        cautare_sedinte_response = response.body[:cautare_sedinte_response]
        result = cautare_sedinte_response[:cautare_sedinte_result]
        if result then
          court = Court.find_by(computer_name: court_name)
          meeting = create_meeting(result, court)
          meeting.save

          court.meetings << meeting
          court.save
        elsif
          request_params.status = "empty"
          request_params.save
        end
      rescue => e
        request_params.status = "error"
        request_params.backtrace = e.backtrace.to_s
        request_params.error_message = e.message
        if e.is_a? Wasabi::Resolver::HTTPError then
          request_params.response_code = e.response.code
        end
        request_params.save
      end

      if request_params.status != "error" then
        request_params.setatus = "finished"
        request_params.save
      end
    end
  end

  def self.create_meeting(result, court)
    binding.pry
    meeting = Meeting.new
    meeting.court = court
    meeting.departament = result[:departament] 
    meeting.complet = result[:complet] 
    meeting.date = result[:data] 
    meeting.hour = result[:ora] 
    return meeting
  end

  def self.is_parsing_time_over
    parsing_hours = (0..5).to_a
    parsing_hours << 23
    return !parsing_hours.include?(Time.now.hour)
  end

end
