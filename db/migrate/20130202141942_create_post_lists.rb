class CreatePostLists < ActiveRecord::Migration
  def change
    create_table :post_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
