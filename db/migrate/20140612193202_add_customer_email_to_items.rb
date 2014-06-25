class AddCustomerEmailToItems < ActiveRecord::Migration
  def change
    add_column :items, :customer_email, :string
  end
end
