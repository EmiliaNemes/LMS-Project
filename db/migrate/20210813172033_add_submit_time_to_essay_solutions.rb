class AddSubmitTimeToEssaySolutions < ActiveRecord::Migration[6.1]
  def change
    add_column :essay_solutions, :submit_time, :datetime
  end
end
