class AddStudentIdToQuizFreeAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_free_answers, :student_id, :integer
  end
end
