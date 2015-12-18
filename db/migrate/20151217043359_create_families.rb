class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :school
      t.string :family_name
      t.string :parent_contact
      t.integer :phone
      t.string :email
      t.string :address

      t.timestamps null: true
    end
  end
end
