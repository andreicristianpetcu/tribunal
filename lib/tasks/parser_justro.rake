namespace :parser_justro do
  desc "Parses the portalquery.just.ro for meetings"
  task meetings: :environment do
    JustroParserHelper.get_justro_meetings
  end

end