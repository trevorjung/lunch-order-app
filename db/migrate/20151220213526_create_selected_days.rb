class CreateSelectedDays < ActiveRecord::Migration
  def change
    create_table :selected_days do |t|
      t.date :date
      t.string :status
      t.integer :family_id
      t.integer :user_id
      t.integer :order_id

      t.timestamps null: true
    end
  end
end
