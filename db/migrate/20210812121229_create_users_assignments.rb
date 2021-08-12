class CreateUsersAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :users_assignments do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.boolean :is_turned_in

      t.timestamps
    end
  end
end
