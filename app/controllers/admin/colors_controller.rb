class Admin::ColorsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @color.save
      flash[:success] = "Color #{@color.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @color.update_attributes(color_params)
      flash[:success] = "Color #{@color.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @color.destroy
    flash[:success] = 'Color was deleted!'
    redirect_to action: 'index'
  end

  private

  def color_params
    params.require(:color).permit(:name)
  end
end