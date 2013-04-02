class Video < ActiveRecord::Base
  attr_accessible :description, :pic, :vid
  mount_uploader :pic, PicUploader
  mount_uploader :vid, VidUploader
end
