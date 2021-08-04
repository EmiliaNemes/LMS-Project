json.extract! users_course, :id, :user_id, :course_id, :is_teacher, :created_at, :updated_at
json.url users_course_url(users_course, format: :json)
