class AddCustomerstuffToItems < ActiveRecord::Migration
  def change
    add_column :items, :customer_first, :string
    add_column :items, :customer_last, :string
  end
end
