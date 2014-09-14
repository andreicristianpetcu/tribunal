class TrialMeeting

  include Mongoid::Document

  field :departament, type: String
  field :complet, type: String
  field :date, type: Date
  field :hour, type: String

  has_many :trial_files
  belongs_to :court, index: true

  # index({ departament: 1 }, { background: true })
  # index({ complet: 1 }, { background: true })
  # index({ date: 1 }, { background: true })

end
