class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :url
      t.integer :essay_id

      t.timestamps
    end
  end
end
