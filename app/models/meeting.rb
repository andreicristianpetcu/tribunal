class TrialMeeting

  include Mongoid::Document

  field :departament, type: String
  field :complet, type: String
  field :date, type: Date
  field :hour, type: String

  has_many :trial_files
  belongs_to :trial_court

end
