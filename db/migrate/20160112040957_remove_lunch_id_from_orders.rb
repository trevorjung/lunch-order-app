class RemoveLunchIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :lunch_id, :integer
  end
end
