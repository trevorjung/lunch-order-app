class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name

      t.timestamps null: true
    end
  end
end
