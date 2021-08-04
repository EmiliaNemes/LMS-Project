json.extract! resource, :id, :name, :url, :lesson_id, :course_id, :created_at, :updated_at
json.url resource_url(resource, format: :json)
