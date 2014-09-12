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
    TrialFile.where(:minified.exists => false, :court => court).distinct(:number).each do |file_number|
      TrialFile.where(:number => file_number).each do |file|
        binding.pry
        proceeding = TrialProceeding.where(number: file_number).first
        if proceeding.nil?
          proceeding = TrialProceeding.new
          proceeding.number = file_number
          proceeding.trial_files = []
        end
        proceeding.case_type = file.case_type
        proceeding.trial_status = file.trial_status
        proceeding.trial_files << file
        proceeding.save
      end
    end
  end
end
