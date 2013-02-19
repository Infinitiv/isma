class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :degree, :string
    add_column :profiles, :title, :string
    add_column :profiles, :email, :string
    add_column :profiles, :phone, :string
  end
end
