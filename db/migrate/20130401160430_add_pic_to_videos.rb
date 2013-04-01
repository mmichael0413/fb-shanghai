class AddPicToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :pic, :string
  end
end
