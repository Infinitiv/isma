class AddColumnToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :parent_id, :integer
    add_column :groups, :administrator, :boolean
    add_column :groups, :moderator, :boolean
    add_column :groups, :writer, :boolean
    add_column :groups, :reader, :boolean
    add_column :groups, :commentator, :boolean
  end
end
