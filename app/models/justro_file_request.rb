class JustroFileRequest < JustroRequest
  include Mongoid::Document

  field :start_date, type: Date
  field :end_date, type: Date

  def self.generate_all
    start_date = Date.new(2013, 1, 1)
    end_date = Date.today - 1
    # end_date = Date.today - 1

    request = JustroFileRequest.new

    CourtDataProviderHelper.get_trial_courts_names.each do |court_name|
      (start_date..end_date).each do |date|
        if(!date.saturday? && !date.sunday?) then
          request = JustroFileRequest.new
          request.court_name = court_name
          request.trial_court = TrialCourt.where(computer_name: court_name).first()
          request.start_date = date
          request.end_date = date
          request.request_type = "file"
          request.status = "notstarted"
          # puts "Saving file request #{request.inspect}"
          request.save
        end
      end
      puts "Saving file request #{request.inspect}"
    end
  end

  def self.get_notstarted
    where(status:"notstarted")
  end

end

