json.questions @questions do |question|
  json.extract! question, :user_id, :description, :query, :created_at, :updated_at
end