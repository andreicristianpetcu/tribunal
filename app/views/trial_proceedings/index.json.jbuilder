json.array!(@trial_proceedings) do |trial_proceeding|
  json.extract! trial_proceeding, :id
  json.url trial_proceeding_url(trial_proceeding, format: :json)
end
