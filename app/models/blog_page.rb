class BlogPage
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
end
