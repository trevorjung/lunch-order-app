class Lunch < ActiveRecord::Base
  has_many :selected_days
  has_many :orders, through: :selected_days
  
end
