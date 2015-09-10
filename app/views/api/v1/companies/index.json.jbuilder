json_envelope(json, @pagination) do
  json.array! @companies do |company|
    json.id company.id
    json.name company.name
  end
end
