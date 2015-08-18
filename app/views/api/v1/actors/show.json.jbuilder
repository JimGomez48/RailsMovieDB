json_envelope(json, @status, @code) do
  json.actor do
    json.id @actor.id
    json.last @actor.last
    json.first @actor.first
    json.sex @actor.sex
    json.dob @actor.dob
    json.dod @actor.dod
  end

  json.movies @movies do |movie|
    json.id movie.id
    json.title movie.title
    json.year movie.year
    json.mpaa_rating movie.rating
    json.company movie.company
    json.role movie.role
  end
end
