json.array!(@trial_files) do |trial_file|
  json.extract! trial_file, :id
  json.url trial_file_url(trial_file, format: :json)
end
