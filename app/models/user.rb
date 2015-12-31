class User < ActiveRecord::Base
  belongs_to :family
  has_many :students
  has_many :selected_days
  has_many :orders

  has_many :student_users
  has_many :students, through: :student_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
