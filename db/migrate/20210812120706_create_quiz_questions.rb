class CreateQuizQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_questions do |t|
      t.integer :quiz_id
      t.string :question

      t.timestamps
    end
  end
end
