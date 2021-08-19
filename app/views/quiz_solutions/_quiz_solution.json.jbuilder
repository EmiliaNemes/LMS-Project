json.extract! quiz_solution, :id, :quize_id, :student_id, :grade, :created_at, :updated_at
json.url quiz_solution_url(quiz_solution, format: :json)
