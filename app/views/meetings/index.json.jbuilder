json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :departament, :complet, :data, :hour
  json.url meeting_url(meeting, format: :json)
end
