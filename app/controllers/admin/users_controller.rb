class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = "User #{@user.email} was created!"
      redirect_to @user
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "User #{@user.email} was updated!"
      redirect_to @user
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    @user.destroy
    flash[:success] = "User #{@user.email} was deleted!"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end
