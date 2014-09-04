class JustroFile
  include Mongoid::Document

  field :result, type: Hash

  belongs_to :justro_file_request_param

  def self.get_notstarted
    where(status:"notstarted")
  end

end
