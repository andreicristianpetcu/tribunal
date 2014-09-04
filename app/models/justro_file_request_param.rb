class JustroFileRequestParam
  include Mongoid::Document
  field :court_name, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  #notstarted, started, finished, error, empty
  field :status, type: String
  field :backtrace, type: String
  field :response_code, type: String
  field :error_message, type: String


  def get_meeting_date_formated
    return meeting_date.strftime("%Y-%m-%d")
  end

  def self.generate_all
    start_date = Date.new(2010, 1, 1)
    end_date = Date.today - 1

    CourtDataProviderHelper.get_courts_names.each do |court_name|
      # court_name = 'CurteadeApelBUCURESTI'

      request = JustroFileRequestParam.new
      request.court_name = court_name
      request.start_date = start_date
      request.end_date = end_date
      puts "Saving file request #{request.inspect}"
      request.save
    end
  end

  def self.get_notstarted
    where(status:"notstarted")
  end

end
