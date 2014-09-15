json.array!(@dictionary_terms) do |dictionary_term|
  json.extract! dictionary_term, :id
  json.url dictionary_term_url(dictionary_term, format: :json)
end
