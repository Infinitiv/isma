class Article < ActiveRecord::Base
  attr_accessible :article_type_id, :content, :exp_date, :fixed, :published, :title, :commentable, :user_id, :division_id, :permission_id, :attachment
  belongs_to :user
  has_many :comments, :dependent => :destroy
  belongs_to :article_type
  belongs_to :division
  has_many :group_users, :through => :user
  has_many :groups, :through => :group_users
  has_many :attachments, :dependent => :destroy
end
