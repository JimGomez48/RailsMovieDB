json_envelope(json, @status, @code) do
  json.movies @movies do |movie|
    json.id movie.id
    json.title movie.cleaned_title
    json.year movie.year
    json.mpaa_rating movie.mpaa_rating
    json.companies movie.companies
  end
end
