class RemoveContentFromEssays < ActiveRecord::Migration[6.1]
  def change
    remove_column :essays, :content, :text
  end
end
