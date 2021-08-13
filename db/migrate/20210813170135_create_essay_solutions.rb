class CreateEssaySolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :essay_solutions do |t|
      t.integer :essay_id
      t.integer :student_id
      t.text :content
      t.text :attachments

      t.timestamps
    end
  end
end
