# create albums
class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :filename

      t.timestamps
    end
  end
end
