json_envelope(json, @pagination) do
  json.movie do
    json.id @movie.id
    json.title @movie.cleaned_title
    json.year @movie.year
    json.mpaa_rating @movie.mpaa_rating
    json.companies @movie.companies
  end

  json.genres @genres

  json.directors @directors

  json.actors @movie_actors do |movie_actor|
    json.actor movie_actor.actor
    json.roles movie_actor.movie_actor_roles
  end

  json.reviews @reviews do |review|
    json.id review.id
    json.user review.user
    json.rating review.rating
    json.comment review.comment
    json.created_at review.created_at
  end

  json.avg_rating @avg_rating
end
