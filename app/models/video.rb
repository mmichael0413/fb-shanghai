class Video < ActiveRecord::Base
  attr_accessible :vid, :description, :pic
  
  has_attached_file :pic, 
    :styles => { :medium => "300x300", :thumb => "100x100" },
    :default_url => "/images/rails.png",
    :storage => :azure1
end
