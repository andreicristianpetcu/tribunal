class JustroMeetingRequest < JustroRequest

  field :trial_court_name, type: String
  field :meeting_date, type: Date
  #notstarted, started, finished, error, empty

  def get_meeting_date_formated
    return meeting_date.strftime("%Y-%m-%d")
  end

  def self.generate_all
    CourtDataProviderHelper.get_trial_courts_names.each do |court_name|
      # court_name = 'CurteadeApelBUCURESTI'
      start_date = Date.new(2010, 1, 1)
      end_date = Date.today - 1

      (start_date..end_date).each do |date|
        if(!date.saturday? && !date.sunday?)
          request = JustroMeetingRequest.new
          request.court_name = court_name
          request.meeting_date = date
          puts "Saving meeting request #{request.inspect}"
          request.save
        end
      end
    end
  end

  def self.get_notstarted
    where(status:"notstarted")
  end

  def self.reset_status_for_all
    get_partially_processed
      .find_and_modify({ "$set" => { status: "notstarted", backtrace: nil, error_message: nil, response_code: nil}}, :multi => true)
  end

  def self.get_partially_processed
    where(:status.in => ["started", "finished", "error", "empty"])
  end

end
