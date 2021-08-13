class AddDeadlineAndSubmitTimeAndCourseIdToEssay < ActiveRecord::Migration[6.1]
  def change
    add_column :essays, :deadline, :datetime
    add_column :essays, :submit_time, :datetime
    add_column :essays, :course_id, :integer
  end
end
