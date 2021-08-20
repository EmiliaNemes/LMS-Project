class CreateQuizFreeAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_free_answers do |t|
      t.integer :quiz_question_id
      t.string :free_answer

      t.timestamps
    end
  end
end
