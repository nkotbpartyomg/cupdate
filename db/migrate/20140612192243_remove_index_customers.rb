class RemoveIndexCustomers < ActiveRecord::Migration
  def change
  	remove_index :items, :customer_id
  end
end
