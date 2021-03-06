class TrialFile

  include Mongoid::Document

  field :number, type: String
  field :old_number, type: String
  field :date, type: Date
  field :hour, type: String
  field :case_type, type: String
  field :trial_status, type: String

  belongs_to :trial_meeting

end
