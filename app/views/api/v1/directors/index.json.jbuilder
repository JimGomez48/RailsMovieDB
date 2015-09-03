json_envelope(json, @pagination) do
  json.array! @directors do |director|
    json.extract! director, :id, :last, :first, :dob, :dod
  end
end
