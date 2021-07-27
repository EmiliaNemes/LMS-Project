class AddIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users, [:email, :school_id], :unique => true
  end
end
