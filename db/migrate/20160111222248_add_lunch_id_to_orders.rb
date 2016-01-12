class AddLunchIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :lunch_id, :integer
  end
end
