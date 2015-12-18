class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :family_id
      t.string :family_name
      t.string :student_name
      t.decimal :price
      t.decimal :tax
      t.decimal :subtotal
      t.decimal :total
      t.date :date

      t.timestamps null: false
    end
  end
end
