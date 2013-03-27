class AddAttachmentPicToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :videos, :pic
  end
end
