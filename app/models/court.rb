class Court
  include Mongoid::Document

  field :name, type: String 
  field :computer_name, type: String
  field :population, type: Float
  field :number_of_judges, type: Float
  field :budget, type: Float
  field :total_activity_volume, type: Float
  field :resolved_trial_fields, type: Float
  field :operativity, type: Float
  # field :operativity_median, type: Float
  field :load_per_scheme, type: Float
  field :load_per_judge, type: Float
  field :load_indicator, type: Float
  field :share_per_population, type: Float
  # field :median_load_indicator, type: Float
  field :atacability_indicator, type: Float
  field :casation_indicator, type: Float
  field :safety_indicator, type: Float
  # field :safety_indicator_median, type: Float
  field :duration_in_days, type: Float
  field :duration_in_months, type: Float
  field :share_by_duration, type: Float
  # field :duration_median, type: Float
  field :performance_indicator, type: Float
  # field :performance_median, type: Float

  field :web_site, type: String 
  field :email, type: String 
  field :telephone, type: String 
  field :fax, type: String 
  field :program, type: String 
  field :address, type: String 

  has_many :trial_meetings
  index({ name: 1 }, { background: true })
  index({ computer_name: 1 }, { background: true })

  def proceedings
    TrialProceeding.where(court: self)
  end

  def meetings
    TrialMeeting.where(court: self)
  end

  def judges
    TrialJudge.where(court: self)
  end

end
