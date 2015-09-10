json_envelope(json, @pagination) do
  json.company do
    json.id @company.id
    json.name @company.name
  end

  json.movies @movies do |movie|
    json.id movie.id
    json.title movie.title
    json.year movie.year
    json.mpaa_rating movie.mpaa_rating.value
  end
end
