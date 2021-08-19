class AddGradeToEssaySolutions < ActiveRecord::Migration[6.1]
  def change
    add_column :essay_solutions, :grade, :float
  end
end
