class RemoveFamilyIdAndNameFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :family_id, :integer
    remove_column :orders, :family_name, :string

  end
end
