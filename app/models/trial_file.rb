class TrialFile

  include Mongoid::Document

  field :number, type: String
  field :old_number, type: String
  field :date, type: Date
  field :hour, type: String
  field :case_type, type: String
  field :trial_status, type: String
  field :minified, type: Boolean

  belongs_to :trial_meeting, index: true
  belongs_to :trial_proceeding, index: true
  belongs_to :court, index: true

  index({ number: 1 }, { background: true })
  index({ date: 1 }, { background: true })
  index({ case_type: 1 }, { background: true })
  index({ trial_status: 1 }, { background: true })
  index({ minified: 1 }, { background: true })

  def self.reset_minified_for_all
    TrialFile.where(minified: true).update_all(minified: false)
    TrialFile.where(:minified.exists => false).update_all(minified: false)
  end
end
