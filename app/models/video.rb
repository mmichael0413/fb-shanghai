class Video < ActiveRecord::Base
  attr_accessible :vid, :description, :pic
  
  #has_attached_file :pic, :storage => :azure1
end
