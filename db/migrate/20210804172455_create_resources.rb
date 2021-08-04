class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :url
      t.integer :lesson_id
      t.integer :course_id

      t.timestamps
    end
  end
end
