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
      TrialFile.where(:number => file_number).each do |file|
        proceeding = TrialProceeding.where(number: file_number).first
        if proceeding.nil?
          proceeding = TrialProceeding.new
          proceeding.number = file_number
        end
        proceeding.case_type = file.case_type
        proceeding.trial_status = file.trial_status
        proceeding.trial_files << file
        proceeding.save
        file.minified = true
        file.save
      end
    end
  end

  def self.get_percentage(index, total)
    return "#{(index.to_f/total*100).to_i}%"
  end
end
