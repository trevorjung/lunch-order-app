class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.date :date
      t.boolean :vegetarian
      t.string :entree
      t.string :drink
      t.integer :entree_extra
      t.integer :drink_extra
      t.string :salad
      t.string :fruit

      t.timestamps null: true
    end
  end
end
