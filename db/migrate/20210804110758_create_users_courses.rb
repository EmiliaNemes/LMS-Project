class CreateUsersCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :users_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :is_teacher

      t.timestamps
    end
  end
end
