class RemoveFamilyIdFromSelectedDays < ActiveRecord::Migration
  def change
    remove_column :selected_days, :family_id, :integer
    add_column :selected_days, :lunch_id, :integer
  end
end
