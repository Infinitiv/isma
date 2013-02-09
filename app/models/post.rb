class Post < ActiveRecord::Base
  belongs_to :post_list
  belongs_to :division
  belongs_to :user
  attr_accessible :name, :parent_id, :post_list_id, :division_id, :user_id
end
