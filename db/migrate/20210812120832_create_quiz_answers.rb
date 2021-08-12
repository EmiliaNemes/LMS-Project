class CreateQuizAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_answers do |t|
      t.integer :question_id
      t.string :answer
      t.boolean :is_correct

      t.timestamps
    end
  end
end
