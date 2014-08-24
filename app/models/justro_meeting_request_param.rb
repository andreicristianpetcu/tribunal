class JustroMeetingRequestParam

  include Mongoid::Document
  field :court_name, type: String
  field :meeting_date, type: Date

  def get_meeting_date_formated
    return meeting_date.strftime("%Y-%m-%d")
  end

  def self.generate_all
    CourtDataProviderHelper.get_courts_names.each do |court_name|
      # court_name = 'CurteadeApelBUCURESTI'
      startDate = Date.new(2010, 1, 1)
      endDate = Date.today - 1

      (startDate..endDate).each do |date|
        if(!date.saturday? && !date.sunday?)
          request = JustroMeetingRequestParam.new
          request.court_name = court_name
          request.meeting_date = date
          puts "Saving request #{request.inspect}"
          request.save
        end
      end
    end
  end
end
