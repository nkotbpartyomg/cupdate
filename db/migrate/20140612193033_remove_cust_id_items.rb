class RemoveCustIdItems < ActiveRecord::Migration
  def change
  	remove_column :items, :customer_id, :integer
  end
end
