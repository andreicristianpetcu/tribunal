#edleteme?
class JustRoRequest

  include Mongoid::Document
  store_in database: "justro"

  field :meeting,   type: Hash
  field :requestDate,   type: DateTime
  field :requestParams,   type: Hash
  field :responseResult,   type: Hash

end
