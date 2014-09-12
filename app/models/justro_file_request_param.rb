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
    start_date = Date.new(2013, 1, 1)
    end_date = Date.today - 1
    # end_date = Date.today - 1

    request = JustroFileRequestParam.new

    CourtDataProviderHelper.get_courts_names.no_timeout.each do |court_name|
      (start_date..end_date).each do |date|
        if(!date.saturday? && !date.sunday?) then
          request = JustroFileRequestParam.new
          request.court_name = court_name
          request.start_date = date
          request.end_date = date
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
