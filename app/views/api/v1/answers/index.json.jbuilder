json.extract! @question, :id, :user_id, :description, :query, :created_at, :updated_at, :googled_at
json.answers @question.answers do |answer|
  json.extract! answer, :question_id, :id, :title, :content, :link, :googled, :created_at, :updated_at
end

