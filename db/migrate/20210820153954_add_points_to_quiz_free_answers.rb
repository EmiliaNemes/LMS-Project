class AddPointsToQuizFreeAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_free_answers, :points, :float
  end
end
