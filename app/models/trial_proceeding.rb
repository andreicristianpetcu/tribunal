class TrialProceeding
  include Mongoid::Document

  field :number, type: String
  field :old_number, type: String
  field :case_type, type: String
  field :trial_status, type: String
  field :fnod_duration, type: Float
  field :apel_duration, type: Float
  field :recurs_duration, type: Float

  belongs_to :court, index: true
  has_many :trial_files

  index({ number: 1 }, { background: true })
  index({ old_number: 1 }, { background: true })
  index({ case_type: 1 }, { background: true })
  index({ trial_status: 1 }, { background: true })

end
