json.array!(@file_meetings) do |file_meeting|
  json.extract! file_meeting, :id, :number, :old_number, :date, :hour, :case_type, :trial_status
  json.url file_meeting_url(file_meeting, format: :json)
end
