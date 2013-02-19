class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :article
      t.string :name
      t.binary :data
      t.string :mime_type

      t.timestamps
    end
    add_index :attachments, :article_id
  end
end
