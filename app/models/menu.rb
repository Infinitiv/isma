class Menu < ActiveRecord::Base
  attr_accessible :follow_id, :location, :parent_id, :title, :url
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Menu"
end
