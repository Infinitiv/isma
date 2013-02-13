class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :group_users
  has_many :users, :through => :group_users
  has_many :articles, :through => :users
end
