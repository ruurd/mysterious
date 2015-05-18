json.questions @questions do |question|
  json.extract! question, :id, :user_id, :description, :query, :googled_at, :created_at, :updated_at
end