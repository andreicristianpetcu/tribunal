json.array!(@contact_emails) do |contact_email|
  json.extract! contact_email, :id, :name, :email, :date
  json.url contact_email_url(contact_email, format: :json)
end
