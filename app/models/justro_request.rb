class JustroRequest
  include Mongoid::Document
  store_in database: "justro"

  #notstarted, started, finished, error, empty
  field :status, type: String
  field :backtrace, type: String
  field :error_message, type: String
  field :response_code, type: String
  field :response,   type: Hash

  field :request_date,   type: DateTime
  field :request_params,   type: Hash
  field :response_result,   type: Hash

  belongs_to :trial_court

  def self.get_notstarted
    where(status:"notstarted")
  end

  def self.reset_status_for_all
    get_partially_processed
      .find_and_modify({ "$set" => { status: "notstarted", backtrace: nil, error_message: nil, response_code: nil}}, :multi => true)
  end

  def self.get_partially_processed
    where(:status.in => ["started", "finished", "error", "empty"])
  end

end
