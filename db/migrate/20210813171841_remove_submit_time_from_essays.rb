class RemoveSubmitTimeFromEssays < ActiveRecord::Migration[6.1]
  def change
    remove_column :essays, :submit_time, :datetime
  end
end
