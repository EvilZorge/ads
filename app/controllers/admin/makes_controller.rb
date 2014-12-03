class Admin::MakesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @make.save
      flash[:success] = "Make #{@make.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @make.update_attributes(make_params)
      flash[:success] = "Make #{@make.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @make.destroy
    flash[:success] = 'Make was deleted!'
    redirect_to action: 'index'
  end

  private

  def make_params
    params.require(:make).permit(:name)
  end
end