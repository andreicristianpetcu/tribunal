class CourtsYearlyStatistics
  include Mongoid::Document

  field :operativity_median, type: Float
  field :load_median, type: Float
  field :safety_median, type: Float
  field :duration_median, type: Float
  field :performance_median, type: Float
  field :year, type: Integer

  # index({ year: 1 }, { background: true })

end
