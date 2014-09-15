json.array!(@jurisprudences) do |jurisprudence|
  json.extract! jurisprudence, :id
  json.url jurisprudence_url(jurisprudence, format: :json)
end
