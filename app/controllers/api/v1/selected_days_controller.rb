class Api::V1::SelectedDaysController < ApplicationController

  def create
    @selected_day = SelectedDay.create(
      # email: params[:email], 
      # # user_id: params[:user_id],
      # entree: params[:entree],
      # school_name: params[:school_name],
      # # school_id: params[:school_id],
      # student_name: params[:student_name],
      # # price: params[:price],
      # # tax: params[:tax],
      # # subtotal: params[:subtotal],
      # # total: params[:total],
      # date: params[:date],
      lunch_id: params[:lunch_id],
      order_id: params[:order_id])

    render json: @selected_day 
  end


end
