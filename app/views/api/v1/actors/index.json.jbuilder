json_envelope(json, @status, @code, @pagination) do
  json.array! @actors do |actor|
    json.extract! actor, :id, :last, :first, :sex, :dob, :dod
  end
end
