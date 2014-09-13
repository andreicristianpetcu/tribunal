namespace :parser_justro do

  desc "parses the portalquery.just.ro for file"
  task get_trial_files: :environment do
    ErrorRetryWrapperHelper.run_until_no_error do
      JustroParserHelper.get_justro_files
    end
  end

  desc "parses the portalquery.just.ro for meetings"
  task get_trial_meetings_and_files: :environment do
    ErrorRetryWrapperHelper.run_until_no_error do
      JustroParserHelper.get_justro_meetings
    end
  end

  desc "link files to courts"
  task link_justro_file_to_court: :environment do
    ErrorRetryWrapperHelper.run_until_no_error do
      JustroParserHelper.link_justro_file_to_court
    end
  end

  desc "generate proceedings"
  task generate_proceedings: :environment do
    ErrorRetryWrapperHelper.run_until_no_error do
      TrialFileHelper.compact_trial_files
    end
  end

  desc "process durations"
  task generate_durations: :environment do
    ErrorRetryWrapperHelper.run_until_no_error do
      TrialProceedingHelper.compute_trial_proceeding_duration
    end
  end

end
