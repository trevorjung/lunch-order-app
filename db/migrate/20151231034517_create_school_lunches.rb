class CreateSchoolLunches < ActiveRecord::Migration
  def change
    create_table :school_lunches do |t|
      t.integer :school_id
      t.integer :lunch_id

      t.timestamps null: true
    end
  end
end
