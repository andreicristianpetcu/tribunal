namespace :justro_request_param do

  desc "Generate all the required parameters for the meetings SOAP request"
  task generate_meeting_params: :environment do
    JustroMeetingRequest.generate_all
  end

  desc "Generate all the required parameters for the file SOAP request"
  task generate_file_params: :environment do
    JustroFileRequest.generate_all
  end


end
