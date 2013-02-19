class Attachment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :data, :mime_type, :name
end
