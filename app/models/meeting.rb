class Meeting
  include Mongoid::Document
  field :departament, type: String
  field :complet, type: String
  field :data, type: Date
  field :hour, type: String
  #todo add files (dosar)
  #todo add dosar.meeting_dosar
end
