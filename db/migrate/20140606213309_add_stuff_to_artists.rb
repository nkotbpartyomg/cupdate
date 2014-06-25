class AddStuffToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
    add_column :artists, :email, :string
    add_column :artists, :password, :string
  end
end
