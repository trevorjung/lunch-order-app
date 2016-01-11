class AddUserIdEmailSchoolIdSchoolNameEntreeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :email, :string
    add_column :orders, :school_id, :integer
    add_column :orders, :school_name, :string
    add_column :orders, :entree, :string
  end
end
