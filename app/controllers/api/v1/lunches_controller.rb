class Api::V1::LunchesController < ApplicationController

  def index
    @lunches = Lunch.all
    render json: @lunches
  end


end
