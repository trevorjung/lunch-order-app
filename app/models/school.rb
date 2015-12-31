class School < ActiveRecord::Base
  has_many :users
  has_many :students

  has_many :school_lunches
  has_many :lunches, through: :school_lunches

end
