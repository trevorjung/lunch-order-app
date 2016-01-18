class School < ActiveRecord::Base
  has_many :users

  has_many :student_school
  has_many :students, through: :student_school

  has_many :school_lunches
  has_many :lunches, through: :school_lunches

end
