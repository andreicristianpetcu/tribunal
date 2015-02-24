json.array!(@blog_pages) do |blog_page|
  json.extract! blog_page, :id, :title, :body
  json.url blog_page_url(blog_page, format: :json)
end
