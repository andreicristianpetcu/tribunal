class Jurisprudence
  include Mongoid::Document
  field :titlu, type: String
  field :number, type: String
  field :tip, type: String
  field :domeniu, type: String
  field :decizie_sau_sentinta, type: Mongoid::Boolean
  field :anul, type: Integer
  field :sectia, type: String
  field :scurta_descriere, type: String
  field :descriere_completa, type: String

  belongs_to :court
end
