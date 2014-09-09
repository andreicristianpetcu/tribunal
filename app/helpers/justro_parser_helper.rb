require 'savon'

module JustroParserHelper

  def self.get_soap_client
    @@meetings_soap_client = Savon.client(wsdl: 'http://portalquery.just.ro/query.asmx?WSDL')
  end

  def self.find_file(court_name, start_date, end_date)
    get_soap_client.call(:cautare_dosare, message: {institutie: court_name, dataStart: start_date, dataStop: end_date})
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
            # court.trial_meetings << meeting
            # court.save
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
      if(files_params.is_a?(Array)) then
        files_params.each do |file_params|
          create_trial_file(file_params, meeting)
        end
      elsif (files_params.is_a?(Hash)) then
        file_params = files_params
        create_trial_file(file_params, meeting)
      end
    end
    meeting.save
    court.trial_meetings << meeting
    court.save
  end

  def self.create_trial_file(file_params, meeting)
    file = TrialFile.new
    begin
      file.number = file_params[:numar]
      file.old_number = file_params[:numar_vechi]
      file.date = file_params[:data]
      file.hour = file_params[:ora]
      file.case_type = file_params[:categorie_caz]
      file.trial_status = file_params[:stadiu_procesual]
      file.trial_meeting = meeting
      file.save
      meeting.trial_files << file   
    rescue => e
      puts e
    end
    return file
  end

  def self.is_parsing_time_over
    parsing_hours = (0..5).to_a
    parsing_hours << 23
    return !parsing_hours.include?(Time.now.hour)
    # return false
  end

  def self.show_stats
    notstarted = JustroMeetingRequestParam.where(status: "notstarted").count
    started = JustroMeetingRequestParam.where(status: "started").count
    finished = JustroMeetingRequestParam.where(status: "finished").count
    error = JustroMeetingRequestParam.where(status: "error").count
    empty = JustroMeetingRequestParam.where(status: "empty").count
    total = JustroMeetingRequestParam.count
    processed = (finished.to_f/total)*100
    puts "Meetings processed=#{processed}, finished=#{finished}, error=#{error}, started=#{started}, notstarted=#{notstarted}, empty=#{empty}" 
    notstarted = JustroFileRequestParam.where(status: "notstarted").count
    started = JustroFileRequestParam.where(status: "started").count
    finished = JustroFileRequestParam.where(status: "finished").count
    error = JustroFileRequestParam.where(status: "error").count
    empty = JustroFileRequestParam.where(status: "empty").count
    total = JustroFileRequestParam.count
    processed = (finished.to_f/total)*100
    puts "Files processed=#{processed}, finished=#{finished}, error=#{error}, started=#{started}, notstarted=#{notstarted}, empty=#{empty}" 
  end

  def self.purge_all_and_get_justro_files
    JustroFileRequestParam.delete_all
    JustroFile.delete_all
    JustroFileRequestParam.generate_all
  end

  def self.get_justro_files

    last_court_name = nil
    JustroFileRequestParam.get_notstarted.each do |request_params|
      request_params.status = "started"
      request_params.save
      break if is_parsing_time_over
      begin
        court_name = request_params.court_name 
        start_date = request_params.start_date
        end_date = request_params.end_date
        response = find_file(court_name, start_date, end_date)
        cautare_dosare_response = response.body[:cautare_dosare_response]
        result = cautare_dosare_response[:cautare_dosare_result]
        if result && result[:dosar].size == 1000 then
          raise "there are only 1000 items"
        end
        file = JustroFile.new
        file.result = result
        file.justro_file_request_param = request_params
        file.save
        if last_court_name != court_name then
          last_court_name = court_name
          puts "Request files for #{request_params.inspect}"
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

end
