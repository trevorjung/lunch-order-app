class Order < ActiveRecord::Base
  has_many :selected_days
  has_many :lunches, through: :selected_days
  
end
