class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.references :post_list
      t.references :division
      t.integer :parent_id
      t.references :user

      t.timestamps
    end
    add_index :posts, :post_list_id
    add_index :posts, :division_id
    add_index :posts, :user_id
  end
end
