class SelectedDaysController < ApplicationController

  def index
   if current_user.selected_days.where(status: "selected").any? 
   @selected_days = current_user.selected_days.where(status: 'selected')
   @subtotal = calculate_subtotal(@selected_days)
   @tax = calculate_tax(@selected_days)
   @total = @subtotal + @tax
   else
    redirect_to "/"
   end 

  end

  def create
    @selected_day = SelectedDay.create(
      id: params[:id],
      date: params[:date],
      status: params[:status],
      family_id: params[:family_id],
      user_id: params[:user_id],
      )

  end

  def show
    @selected_day = SelectedDay.find(params[:id])
  end

  def destroy
    selected_day = SelectedDay.find_by(id: params[:id])
    selected_day.status = 'removed'

    if selected_day.save 
      flash[:success] = "#{date} - #{selected_day.lunch.entree} removed from cart"
    else
      flash[:danger] = "Item still selected"
    end
    redirect_to '/selected_days'
  end



end
