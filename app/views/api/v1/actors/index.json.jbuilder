json_envelope(json, @status, @code, @pagination) do
  json.actors @actors do |actor|
    json.extract! actor, :id, :last, :first, :sex, :dob, :dod
  end
end
