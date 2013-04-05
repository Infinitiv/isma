class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :location
      t.integer :parent_id
      t.integer :follow_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
