class Api::V1::OrdersController < ApplicationController

  def create
    @order = Order.create(
      # email: params[:email], 
      # user_id: params[:user_id],
      # entree: params[:entree],
      # school_name: params[:school_name],
      # school_id: params[:school_id],
      # student_name: params[:student_name],
      # price: params[:price],
      tax: params[:tax],
      subtotal: params[:subtotal],
      total: params[:total],
      date: params[:date])
      # lunch_id: params[:lunch_id])

    params[:lunches].each do |lunch|
      @selected_day = SelectedDay.create(lunch_id: lunch[:id], 
        order_id: @order.id,
        date: lunch[:date])
    end

    # puts params[:lunches]

    render json: @order 
  end


end
