class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :articles, :up_down, :commentable
  end

  def down
  end
end
