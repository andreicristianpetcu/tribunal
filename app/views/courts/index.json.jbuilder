json.array!(@courts) do |court|
  json.extract! court, :id
  json.url court_url(court, format: :json)
end
