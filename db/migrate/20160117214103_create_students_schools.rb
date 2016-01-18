class CreateStudentsSchools < ActiveRecord::Migration
  def change
    create_table :students_schools do |t|

      t.timestamps null: false
    end
  end
end
