class AddSchoolIdAndStudentIdToStudentsSchools < ActiveRecord::Migration
  def change
    add_column :students_schools, :school_id, :integer
    add_column :students_schools, :student_id, :integer
  end
end
