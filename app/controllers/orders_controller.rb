class OrdersController < ApplicationController

  def create
    days_selected = SelectDay.where(user_id: current_user_id, status: 'selected')

    subtotal = calculate_subtotal(days_selected)
    tax = calculate_tax(days_selected)
    total = tax + subtotal

    @order = Order.create(
      id: params[:id],
      family_id: params[:family_id], 
      family_name: params[:family_name], 
      student_name: params[:student_name],
      price: params[:price],
      tax: params[:tax],
      subtotal: params[:subtotal],
      total: params[:total],
      date: params[:date])

    render json: @order 
  end

  def show
    @order = Order.find(params[:id])
  end

end
