class DropTableUsersAssignments < ActiveRecord::Migration[6.1]
  def change
    drop_table :users_assignments
  end
end
