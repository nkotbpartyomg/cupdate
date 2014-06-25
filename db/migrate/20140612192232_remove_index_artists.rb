class RemoveIndexArtists < ActiveRecord::Migration
  def change
  	remove_index :items, :artist_id
  end
end
