class Student < ActiveRecord::Base
  belongs_to :user

  has_many :student_users
  has_many :users, through: :student_users
  
end
