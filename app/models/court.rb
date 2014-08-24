class Court

  include Mongoid::Document

  field :computer_name, type: String
  field :name, type: String

end
