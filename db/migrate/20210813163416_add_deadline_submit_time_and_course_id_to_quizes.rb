class AddDeadlineSubmitTimeAndCourseIdToQuizes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizes, :deadline, :datetime
    add_column :quizes, :submit_time, :datetime
    add_column :quizes, :course_id, :integer
  end
end
