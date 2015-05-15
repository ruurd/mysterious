json.users @users do |user|
  json.extract! user, :email, :admin, :created_at, :updated_at
end