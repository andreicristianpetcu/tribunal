namespace :parser_justro do

  desc "parses the portalquery.just.ro for file"
  task get_trial_files: :environment do
    JustroParserHelper.get_justro_files
  end

  desc "parses the portalquery.just.ro for meetings"
  task get_trial_meetings_and_files: :environment do
    JustroParserHelper.get_justro_meetings
  end

end
