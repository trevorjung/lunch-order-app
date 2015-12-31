class AddMonthToLunches < ActiveRecord::Migration
  def change
    add_column :lunches, :month, :string
  end
end
