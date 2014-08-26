json.array!(@trial_meetings) do |trial_meeting|
  json.extract! trial_meeting, :id
  json.url trial_meeting_url(trial_meeting, format: :json)
end
