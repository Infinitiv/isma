class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :division_id, :integer
    add_column :articles, :permission_id, :integer
  end
end
