class CreateStudentSchools < ActiveRecord::Migration
  def change
    create_table :student_schools do |t|
      t.integer :school_id
      t.integer :student_id

      t.timestamps null: true
    end
  end
end
