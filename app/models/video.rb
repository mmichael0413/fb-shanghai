require 'waz-blobs'

class Video < ActiveRecord::Base
  attr_accessible :description, :pic, :vid
  mount_uploader :pic, PicUploader
  mount_uploader :vid, VidUploader
  
  def upload_it
    # set Azure Storage credentials
    account_name = 'fbshanghai2013test1'
    access_key = 'BL0VOt/aw13LXqzw4lg0phs7sIQaP93rfcElrZdBgLqmTDWlVohn3q81Srb4GsbRm7AM6V/qpol7B+E1b2AF8w=='
    
    # connect to Azure Storage using waz-storage gem
    WAZ::Storage::Base.establish_connection!(:account_name => account_name, :access_key => access_key)
    
    # create a container
    container = WAZ::Blobs::Container.find('test-images')

    #blob = container.store("#{self.vid_url}", "#{self.description}", "#{self.vid.file.extension.downcase}")
    #container.store("#{self.pic_url}", "#{self.description}", "#{self.pic.file.extension.downcase}")
    open("/Users/mikemichaelevich/Programs/Fullbridge/fb-shanghai/public#{self.pic_url}", 'rb') do |f|
      container.store('blob-test1', f.read, "image/#{self.pic.file.extension.downcase}")
    end
  end
end
