json_envelope(json, @status, @code) do
  json.array! @movies do |movie|
    json.id movie.id
    json.title movie.cleaned_title
    json.year movie.year
    json.mpaa_rating movie.mpaa_rating.value
    json.companies movie.companies
  end
end
