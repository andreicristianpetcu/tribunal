module TrialFileHelper

  def self.compact_trial_files
    court_number = Court.all.size
    Court.each_with_index do |court, index|
      puts "------------#{get_percentage(index, court_number)} Computing court procedding for court name #{court.name}" 
      minify_files_inc_court(court)
    end
  end

  def self.minify_files_inc_court(court)
    # if court.nil?
    #   court = Court.find("53fba7656c6f6338e3010000")
    # end
    
    # distinct_file_numbers = TrialFile.where(:minified.exists => false, :court => court, :number => /2013/).distinct(:number)
    distinct_file_numbers = TrialFile.where(:minified => false, :court => court, :number => /2013/).distinct(:number)
    # file_count = distinct_file_numbers.size
    distinct_file_numbers.each_with_index do |file_number, index|
      # puts "#{get_percentage(index, file_count)} Computing proceeding for file number #{file_number}" 
      TrialFile.where(:number => file_number).each do |trial_file|
        trial_proceeding = TrialProceeding.where(number: file_number).first
        if trial_proceeding.nil?
          trial_proceeding = TrialProceeding.new
          trial_proceeding.number = file_number
        end
        trial_proceeding.case_type = trial_file.case_type
        trial_proceeding.trial_status = trial_file.trial_status
        trial_proceeding.trial_files << trial_file
        trial_proceeding.save
        trial_file.trial_proceeding = trial_proceeding
        trial_file.minified = true
        trial_file.save
      end
    end
  end

  def self.get_percentage(index, total)
    return "#{(index.to_f/total*100).to_i}%"
  end
end
