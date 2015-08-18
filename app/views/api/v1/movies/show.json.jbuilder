json_envelope(json, @status, @code) do
  json.movie do
    json.id @movie.id
    json.title @movie.title
    json.year @movie.year
    json.mpaa_rating @movie.rating
    json.company @movie.company
  end
  json.genres @genres do |genre|
    json.extract! genre, :id, :name
  end
  json.directors do |director|
    json.extract! director, :id, :last, :first, :dob, :dod
  end
  json.actors do |actor|
    json.extract! actor, :id, :last, :first, :sex, :dob, :dod
  end
  json.reviews do |review|
    json.extract! review, :id, :username, :movie_id, :rating, :comment , :created_at, :updated_at
  end
end
