class AddIndexToItems < ActiveRecord::Migration
  def change
  	add_index :items, :artist_id
  	add_index :items, :customer_id
  end
end
