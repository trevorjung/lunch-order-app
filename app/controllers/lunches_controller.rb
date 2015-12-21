class LunchesController < ApplicationController

  def index
    @lunches = Lunch.all
  end

  def create
    @lunch = Lunch.create(
      id: params[:id], 
      date: params[:date], 
      vegetarian: params[:vegetarian], 
      entree: params[:entree], 
      drink: params[:drink], 
      entree_extra: params[:entree_extra], 
      drink_extra: params[:drink_extra], 
      salad: params[:salad], 
      fruit: params[:fruit])
  end
  
  def new
    @lunch = Lunch.new
  end

  def show
    @lunch = Lunch.find(params[:id])
  end

  def edit
    @lunch = Lunch.find(params[:id])
  end

  def update
  end

  def destroy
    lunch = Lunch.find_by(id: params[:id])
    lunch.destroy
    flash[:danger] = "Lunch Item removed"
    redirect_to "/"
  end


end
