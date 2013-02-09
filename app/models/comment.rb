class Comment < ActiveRecord::Base
  attr_accessible :article_id, :parent_id, :content, :user_id
  belongs_to :article
  belongs_to :user
end
