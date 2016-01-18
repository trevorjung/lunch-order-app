class Api::V1::StudentsController < ApplicationController

  def index
    @students = Student.where(user_id: current_user.id)
    # @students = Student.all
    render json: @students
  end
end
