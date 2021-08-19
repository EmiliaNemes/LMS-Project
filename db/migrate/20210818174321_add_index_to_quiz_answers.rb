class AddIndexToQuizAnswers < ActiveRecord::Migration[6.1]
  def change
    add_index :quiz_answers, :quiz_question_id
  end
end
