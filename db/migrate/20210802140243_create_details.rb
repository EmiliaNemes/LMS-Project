class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :administrator
      t.boolean :teacher
      t.boolean :student

      t.timestamps
    end
  end
end
