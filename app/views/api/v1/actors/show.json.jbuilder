json_envelope(json) do
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
    json.mpaa_rating movie.mpaa_rating
    json.companies movie.companies
    json.roles @actor.movie_actor_role(movie.id)
  end
end
