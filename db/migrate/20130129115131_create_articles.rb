class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.date :exp_date
      t.boolean :up_down, :default => true
      t.boolean :published, :default => true
      t.boolean :fixed, :default => false
      t.references :article_type
      t.references :user

      t.timestamps
    end
  end
end
