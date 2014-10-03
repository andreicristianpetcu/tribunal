class JustroRequest
  include Mongoid::Document
  store_in database: "justro"

  field :status, type: String
  field :backtrace, type: String
  field :error_message, type: String
  field :response_code, type: String
  field :response,   type: Hash

  field :requestDate,   type: DateTime
  field :requestParams,   type: Hash
  field :responseResult,   type: Hash

  belongs_to :court
end
