class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :phone, :address, :parent_contact, :family_name, :school) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :family_name, :school, :phone, :address, :parent_contact, :password, :password_confirmation, :current_password) }
  end

  private

  def calculate_subtotal(selected_days)
    subtotal = 0
    selected_days.each do |selected_day|
      subtotal += (selected_day.product.price * selected_day.quantity)
    end
    return subtotal
  end

  def calculate_tax(selected_days)
    tax = 0
    selected_days.each do |selected_day|
      tax += (selected_day.product.tax * selected_day.quantity)
    end
    return tax
  end 






  
end
