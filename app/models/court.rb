class Court

  include Mongoid::Document

  field :name, type: String
  field :computer_name, type: String
  field :population, type: Integer
  field :number_of_judges, type: Integer
  field :budget, type: Integer
  field :total_activity_volume, type: Integer
  field :resolved_trial_fields, type: Integer
  field :operativity, type: Integer
  field :operativity_median, type: Integer
  field :load_per_scheme, type: Integer
  field :load_per_judge, type: Integer
  field :load_indicator, type: Integer
  field :share_per_population, type: Integer
  field :median_load_indicator, type: Integer
  field :atacability_indicator, type: Integer
  field :casation_indicator, type: Integer
  field :safety_indicator, type: Integer
  field :safety_indicator_median, type: Integer
  field :duration_in_days, type: Integer
  field :duration_in_months, type: Integer
  field :share_by_duration, type: Integer
  field :duration_median, type: Integer
  field :performance_indicator, type: Integer
  field :performance_median, type: Integer

  has_many :trial_meetings

end
