class Video < ActiveRecord::Base
  attr_accessible :vid
  
  has_attached_file :vid, :storage => :azure1
end
