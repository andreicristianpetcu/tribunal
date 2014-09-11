module TrialFileHelper

  def self.compact_trial_files
    binding.pry
    Court.each do |court|
      minify_files_inc_court(court)
    end
  end

  def self.minify_files_inc_court(court)
    if court.nil?
      court = Court.find("53fba7656c6f6338e3010000")
    end
    last_file = nil
    TrialFile.where(:minified.exists => false, :court => court).distinct(:number).each do |file_number|
      TrialFile.where(:number => file_number).each do |file|
        binding.pry
        # if last_file.nil?
        #   last_file = file
        #   last_file.minified = true
        #   last_file.save
        #   puts "Saved last #{last_file}"
        # else
        #   if last_file.number == file.number then
        #     if last_file.number &&
        #       last_file.old_number == file.old_number &&
        #       last_file.date == file.date &&
        #       # last_file.hour == file.hour &&
        #       last_file.case_type == file.case_type &&
        #       last_file.trial_status == file.trial_status &&
        #       last_file.trial_meeting == file.trial_meeting &&
        #       last_file.court == file.court then
        #       file.delete
        #     else
        #       last_file = file
        #       last_file.minified = True
        #       last_file.save
        #     end
        #   end
        # end

      end
    end
  end
end
