class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :school

  has_many :student_school
  has_many :schools, through: :student_school

  has_many :student_users
  has_many :users, through: :student_users
  
end
