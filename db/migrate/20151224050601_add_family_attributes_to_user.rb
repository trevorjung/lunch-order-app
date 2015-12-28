class AddFamilyAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :school, :string
    add_column :users, :family_name, :string 
    add_column :users, :parent_contact, :string
    add_column :users, :phone, :integer 
    add_column :users, :address, :string
  end
end
