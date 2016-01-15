class RemoveAttributesFromLunches < ActiveRecord::Migration
  def change
    remove_column :lunches, :drink, :string
    remove_column :lunches, :drink_extra, :string
    remove_column :lunches, :entree_extra, :string
    remove_column :lunches, :fruit, :string
    remove_column :lunches, :salad, :string
    remove_column :lunches, :vegetarian, :string
  end
end
