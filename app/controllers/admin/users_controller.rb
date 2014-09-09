class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
  end

  def create
    if @user.save
      flash[:success] = "User #{@user.email} was created!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    #if params[:user][:password].blank?
    #  params[:user].delete(:password)
    #  params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
    #end
    #if @user.valid_password?(params[:user][:current_password])
    if @user.update_attributes(user_params)
      flash[:success] = "User #{@user.email} was updated!"
      redirect_to @user
    else
      render 'edit'
    end
    #else redirect_to root_url
    #end
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
