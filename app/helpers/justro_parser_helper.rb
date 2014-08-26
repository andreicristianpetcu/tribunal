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
      request_params.status = "started"
      request_params.save
      break if is_parsing_time_over
      puts "Request meeting for #{request_params.inspect}"
      begin
        court_name = request_params.court_name 
        meeting_date = request_params.meeting_date
        response = find_meeting(court_name, meeting_date)
        cautare_sedinte_response = response.body[:cautare_sedinte_response]
        result = cautare_sedinte_response[:cautare_sedinte_result]
        if result && result[:sedinta] then
          meeting_results = result[:sedinta]
          court = Court.where(computer_name: court_name).first

          meeting_results.each do |meeting_result|
            create_meeting(meeting_result, court)
            court.trial_meetings << meeting
            court.save
          end

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
        request_params.status = "finished"
        request_params.save
      end
    end
  end

  def self.create_meeting(meeting_result, court)
    meeting = TrialMeeting.new
    meeting.court = court
    meeting.departament = meeting_result[:departament] 
    meeting.complet = meeting_result[:complet] 
    meeting.date = meeting_result[:data] 
    meeting.hour = meeting_result[:ora] 
    if meeting_result[:dosare] && meeting_result[:dosare][:sedinta_dosar] && meeting_result[:dosare][:sedinta_dosar].size > 0 then
      files_params = meeting_result[:dosare][:sedinta_dosar]
      files_params.each do |file_params|
        file = TrialFile.new
        file.number = file_params[:numar]
        file.old_number = file_params[:numar_vechi]
        file.date = file_params[:data]
        file.hour = file_params[:ora]
        file.case_type = file_params[:categorie_caz]
        file.trial_status = file_params[:stadiu_procesual]
        file.trial_meeting = meeting
        file.save
        meeting.trial_files << file   
      end
    end
    meeting.save
  end

  def self.is_parsing_time_over
    parsing_hours = (0..5).to_a
    parsing_hours << 23
    return !parsing_hours.include?(Time.now.hour)
    # return false
  end

end
