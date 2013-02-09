class DivisionType < ActiveRecord::Base
  attr_accessible :name
  has_many :divisions
end
