class Video < ActiveRecord::Base
  attr_accessible :description, :pic
  mount_uploader :pic, PicUploader
end
