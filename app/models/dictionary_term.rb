class DictionaryTerm
  include Mongoid::Document
  field :termen, type: String
  field :legaleza, type: String
  field :romana, type: String
end
