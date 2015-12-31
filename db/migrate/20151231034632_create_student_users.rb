class CreateStudentUsers < ActiveRecord::Migration
  def change
    create_table :student_users do |t|
      t.integer :student_id
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
