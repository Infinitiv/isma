class Division < ActiveRecord::Base
  attr_accessible :location_geo_latitude, :location_geo_longitude, :location_verbose, :name
  has_many :posts
  has_many :users, :through => :posts
  has_many :articles, :through => :users
end
