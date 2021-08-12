class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.datetime :deadline
      t.datetime :submit_time
      t.integer :course_id
      t.integer :assignmentable_id
      t.string :assignmentable_type

      t.timestamps
    end
  end
end
