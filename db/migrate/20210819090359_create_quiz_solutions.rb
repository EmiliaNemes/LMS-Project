class CreateQuizSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_solutions do |t|
      t.integer :quize_id
      t.integer :student_id
      t.float :grade

      t.timestamps
    end
  end
end
