class CreateEssays < ActiveRecord::Migration[6.1]
  def change
    create_table :essays do |t|
      t.string :name
      t.string :description
      t.text :content

      t.timestamps
    end
  end
end
