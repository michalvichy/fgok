# Add album references to images
class AddAlbumRefToImages < ActiveRecord::Migration
  def change
    add_reference :images, :album, index: true
  end
end
