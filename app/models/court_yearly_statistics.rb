class CourtYearlyStatistics
  include Mongoid::Document

  field :operativity_median, type: Float
  field :load_median, type: Float
  field :safety_median, type: Float
  field :duration_median, type: Float
  field :performance_median, type: Float
  field :year, type: Integer

  belongs_to :court, index: true

  index({ year: 1 }, { background: true })

  def self.insert_for_year(year)
    Court.each do |court|
      statistics = where(:year => year, :court => court).first  
      if statistics.nil?
        statistics = CourtYearlyStatistics.new(:year => year, :court => court)
        statistics.save
      end
    end
  end
end
