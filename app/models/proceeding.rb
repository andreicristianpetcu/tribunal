class Proceeding
  include Mongoid::Document

  field :number, type: String
  field :old_number, type: String
  field :case_type, type: String
  field :trial_status, type: String

  belongs_to :court
  has_many :trial_files

end
