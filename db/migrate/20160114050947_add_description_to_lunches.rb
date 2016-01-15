class AddDescriptionToLunches < ActiveRecord::Migration
  def change
    add_column :lunches, :description, :text
  end
end
