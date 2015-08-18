json.movies @movies do |movie|
  json.extract! movie, :id, :title, :year, :rating, :company
end
