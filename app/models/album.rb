# model Album
class Album < ActiveRecord::Base
  has_many :images
end
