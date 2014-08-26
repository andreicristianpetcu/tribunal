namespace :parser_justro do
  desc "Parses the portalquery.just.ro for meetings"
  task get_trial_meetings_and_files: :environment do
    JustroParserHelper.get_justro_meetings
  end

end
