class JustroFile
  include Mongoid::Document

  field :status, type: String
  field :respnse, type: Hash

  def self.get_notstarted
    where(status:"notstarted")
  end

end
