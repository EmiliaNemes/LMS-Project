class RemoveStudentIdFromQuizes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizes, :student_id, :integer
  end
end
