namespace :justro_request_param do
  desc "Generate all the required parameters for the meetings SOAP request"
  task generate_meeting_params: :environment do
    JustroMeetingRequestParam.generate_all
  end

end
