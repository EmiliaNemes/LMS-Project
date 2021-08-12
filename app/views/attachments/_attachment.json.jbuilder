json.extract! attachment, :id, :name, :url, :essay_id, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
