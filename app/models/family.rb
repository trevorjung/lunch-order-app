class Family < ActiveRecord::Base
  has_many :students
  has_many :orders
  has_many :selected_days
  
end
