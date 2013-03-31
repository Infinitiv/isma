class AddColumnToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :avatar, :binary
    add_column :profiles, :thumbnail, :binary
  end
end
