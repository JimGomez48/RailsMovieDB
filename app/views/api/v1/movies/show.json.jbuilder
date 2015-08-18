json.movie do
  json.id @movie.id
  json.title @movie.title
  json.year @movie.year
  json.mpaa_rating @movie.rating
  json.company @movie.company
end
