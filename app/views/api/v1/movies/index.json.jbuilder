json_envelope(json, @status, @code) do
  json.movies @movies do |movie|
    json.id movie.id
    json.title movie.cleaned_title
    json.year movie.year
    json.mpaa_rating movie.mpaa_rating.value
    # json.companies movie.companies
    json.companies movie.companies do |company|
      json.name company.name
    end
  end
end
