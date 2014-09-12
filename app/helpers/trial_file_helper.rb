module TrialFileHelper

  def self.compact_trial_files
    # TrialFile.reset_minified_for_all
    court_number = Court.all.size

    per_batch = 2
    index = 0
    0.step(Court.count, per_batch) do |offset|
      Court.limit(per_batch).skip(offset).each do |court|
        puts "------------#{get_percentage(index, court_number)} Computing court procedding for court name #{court.name}" 
        index += 1
        minify_files_in_court(court)
      end
    end
  end

  def self.minify_files_in_court(court)
    #trial_file number ends with /2013
    distinct_file_numbers = TrialFile.where(minified: false, court: court, number: /\/2013$/).distinct(:number)
    process_trial_proceedings_from_files(distinct_file_numbers, court)

    start_date = Date.new(2013, 1, 1)
    end_date = Date.new(2014, 1, 1) - 1
    distinct_file_numbers = TrialFile.where(minified: false, court: court).gt(date: start_date).lt(date: end_date).where(number: /\/2013\//).distinct(:number)
    process_trial_proceedings_from_files(distinct_file_numbers, court)
  end

  def self.process_trial_proceedings_from_files(distinct_file_numbers, court)
    distinct_file_numbers.each_with_index do |file_number, index|
      TrialFile.where(:number => file_number, court: court).each do |trial_file|
        trial_proceeding = TrialProceeding.where(number: file_number).first
        if trial_proceeding.nil?
          trial_proceeding = TrialProceeding.new
          trial_proceeding.number = file_number
          trial_proceeding.court = court
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
