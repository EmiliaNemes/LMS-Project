json.extract! quiz_question, :id, :question, :created_at, :updated_at
json.url quiz_question_url(quiz_question, format: :json)
