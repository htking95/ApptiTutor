json.array!(@skills) do |skill|
  json.extract! skill, :id, :skillCol
  json.url skill_url(skill, format: :json)
end
