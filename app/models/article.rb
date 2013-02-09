class Article < ActiveRecord::Base
  attr_accessible :article_type_id, :content, :exp_date, :fixed, :published, :title, :commentable, :user_id
  belongs_to :user
  has_many :comments, :dependent => :destroy
  belongs_to :article_type
end
