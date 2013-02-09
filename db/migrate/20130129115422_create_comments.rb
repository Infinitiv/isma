class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.references  :article
      t.references  :user

      t.timestamps
    end
  end
end
