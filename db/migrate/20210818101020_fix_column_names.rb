class FixColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :quiz_answers, :question_id, :quiz_question_id
    rename_column :quiz_questions, :quiz_id, :quize_id
  end
end
