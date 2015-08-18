json_envelope(json, @status, @code) do
  json.movies @movies do |movie|
    json.extract! movie, :id, :title, :year, :rating, :company
  end
end
