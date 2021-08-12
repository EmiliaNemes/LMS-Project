json.extract! users_assignment, :id, :user_id, :assignment_id, :is_turned_in, :created_at, :updated_at
json.url users_assignment_url(users_assignment, format: :json)
