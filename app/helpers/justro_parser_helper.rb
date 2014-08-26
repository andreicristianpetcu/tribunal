require 'savon'

module JustroParserHelper

  # def self.get_parser_request_params
  #   request_params_list = []
  #   startDate = Date.new(2000, 1, 1)
  #   endDate = Date.today - 1
  #   # startDate = Date.new(2014, 3, 5)
  #   # startDate = Date.new(2014, 6, 1)
  #   # endDate = startDate + 3
  #   # endDate = startDate
  #
  #   CourtDataProviderHelper.get_courts_names.each do |court_name|
  #     # court_name = 'CurteadeApelBUCURESTI'
  #     (startDate..endDate).each do |date|
  #       if(!date.saturday? && !date.sunday?)
  #         request_param = {}
  #         request_param[:court_name] = court_name
  #         request_param[:requestDate] = date.strftime("%Y-%m-%d")
  #         request_params_list << request_param
  #       end
  #     end
  #   end
  #   request_params_list
  # end
  #
  def get_soap_client
    @meetings_soap_client = Savon.client(wsdl: 'http://portalquery.just.ro/query.asmx?WSDL')
  end

  def find_meeting(court_name, request_date)
    get_soap_client.call(:cautare_sedinte, message: {institutie: court_name, dataSedinta: request_date})
  end

  def self.get_justro_meetings
    # meetings = []
    JustroMeetingRequestParam.get_notstarted.each do |request_params|
      request_params.status = "started"
      request_params.save
      break if is_parsing_time_over
      puts "Request meeting for #{request_params.inspect}"
      # meeting = {}
      # meeting[:request_param] = request_params
      begin
        court_name = request_params.court_name, 
        meeting_date = request_params.meeting_date
        response = find_meeting(meeting_date)
        cautare_sedinte_response = response.body[:cautare_sedinte_response]
        result = cautare_sedinte_response[:cautare_sedinte_result]
        if result then
          court = Court.find_by_name(court_name)
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
        if e.is_a? Wasabi::Resolver::HTTPError then
          request_params.response_code = e.response.code
        end
        request_params.save
      end

      request_params.setatus = "finished"
      request_params.save
    end
  end

  def create_meeting(result, court)
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

  def self.save_meeting_to_mongo(meeting)
    # binding.pry
    # puts meeting[:departament]
    requestDate = DateTime.now()
    # requestParams = {}
    # requestParZWams
    JustRoRequest.create(
      meeting: meeting, 
      requestDate: requestDate)
  end
end
