class Group < ActiveRecord::Base
  attr_accessible :name, :parent_id, :administrator, :moderator, :writer, :reader, :commentator
  has_many :group_users
  has_many :users, :through => :group_users
  has_many :articles, :through => :users
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Group"
end
