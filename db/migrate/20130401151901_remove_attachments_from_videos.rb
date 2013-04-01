class RemoveAttachmentsFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :vid_file_name
    remove_column :videos, :vid_content_type
    remove_column :videos, :vid_file_size
    remove_column :videos, :vid_updated_at
    remove_column :videos, :pic_file_name
    remove_column :videos, :pic_content_type
    remove_column :videos, :pic_file_size
    remove_column :videos, :pic_updated_at
  end
end
