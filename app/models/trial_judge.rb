class TrialJudge
  include Mongoid::Document
  field :name, type: String
  field :surname, type: String

  belongs_to :court
end
