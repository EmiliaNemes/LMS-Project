json.extract! quiz_answer, :id, :question_id, :answer, :is_correct, :created_at, :updated_at
json.url quiz_answer_url(quiz_answer, format: :json)
