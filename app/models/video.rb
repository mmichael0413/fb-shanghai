class Video < ActiveRecord::Base
  attr_accessible :vid, :description
  
  #has_attached_file :vid, :storage => :azure1
end
