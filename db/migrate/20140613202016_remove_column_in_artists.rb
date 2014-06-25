class RemoveColumnInArtists < ActiveRecord::Migration
  def change
  	remove_column :artists, :password
  end
end
