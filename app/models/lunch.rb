class Lunch < ActiveRecord::Base
  has_many :selected_days
  has_many :orders, through: :selected_days

  has_many :school_lunches
  has_many :schools, through: :school_lunches
  
end
