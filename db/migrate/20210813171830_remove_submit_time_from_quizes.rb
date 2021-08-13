class RemoveSubmitTimeFromQuizes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizes, :submit_time, :datetime
  end
end
