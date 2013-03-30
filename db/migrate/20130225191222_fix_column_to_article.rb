class FixColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :group_id, :integer
    remove_column :articles, :permission_id
    add_index :articles, :group_id
  end

  def down
  end
end
