class CreateClassRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :class_registers do |t|
      t.integer :course_id
      t.integer :assignment_id
      t.integer :student_id
      t.float :grade
      t.integer :grading_teacher_id

      t.timestamps
    end
  end
end
