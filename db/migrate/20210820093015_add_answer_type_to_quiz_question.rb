class AddAnswerTypeToQuizQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_questions, :answer_type, :string
  end
end
