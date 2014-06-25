class AddStuffToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :description, :string
    add_column :items, :artist_id, :integer
    add_column :items, :customer_id, :integer
    add_column :items, :status, :string
    add_column :items, :note, :text
  end
end
