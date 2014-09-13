class JustroFile
  include Mongoid::Document

  field :result, type: Hash

  belongs_to :justro_file_request_param

  index({ "result.dosar.numar" => 1 }, { background: true })
  index({ "result.dosar.institutie" => 1 }, { background: true })

  def self.get_notstarted
    where(status:"notstarted")
  end

end
