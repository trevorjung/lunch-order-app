class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_name
      t.integer :grade
      t.integer :family_id

      t.timestamps null: true
    end
  end
end
