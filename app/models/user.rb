class User < ActiveRecord::Base
  attr_accessible :login, :password, :password_confirmation
  validates :login, :presence => true, 
            :length => { :maximum => 50 }, 
            :uniqueness => true
  has_secure_password
  has_one :profile
  has_many :articles
  has_many :comments
  has_many :group_users
  has_many :groups, :through => :group_users
  has_many :posts
  has_many :divisions, :through => :posts
end
