class AddPointsToQuizQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_questions, :points, :float
  end
end
