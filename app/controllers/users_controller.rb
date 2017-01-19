class UsersController < ApplicationController
  load_resource

  def show
    @advertisments = @user.advertisments
  end

  def search
    @advertisments = Advertisment.where("title ILIKE :title AND state = :state AND user_id = :user_id", title: "%#{params[:search]}%", state: params[:state], user_id: @user.id)
    render :show
  end
end
