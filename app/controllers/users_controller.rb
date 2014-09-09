class UsersController < ApplicationController
  load_resource

  def show
    @advertisments = @user.advertisments
  end

  def search
    @advertisments = Advertisment.search(params[:search], conditions: { type: params[:type], state: params[:state]},with: {user: @user.id }, 
      star: true)
    render :show
  end
end
