class AddSolutionToQuizSolutions < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_solutions, :solution, :string
  end
end
