class SelectedDay < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch 
  belongs_to :order

end
