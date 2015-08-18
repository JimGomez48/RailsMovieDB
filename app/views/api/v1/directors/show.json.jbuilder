json_envelope(json, @status, @code) do
  json.director do
    json.id @director.id
    json.last @director.last
    json.first @director.first
    json.dob @director.dob
    json.dod @director.dod
  end

  json.movies @movies do |movie|
    json.id movie.id
    json.title movie.title
    json.year movie.year
    json.mpaa_rating movie.rating
    json.company movie.company
  end
end
