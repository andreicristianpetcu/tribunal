json.array!(@proceedings) do |proceeding|
  json.extract! proceeding, :id
  json.url proceeding_url(proceeding, format: :json)
end
