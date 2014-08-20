class JustRoRequest

  include Mongoid::Document

  field :meeting,   type: Hash
  field :requestDate,   type: DateTime
  field :requestParams,   type: Hash
  field :responseResult,   type: Hash
 
end
