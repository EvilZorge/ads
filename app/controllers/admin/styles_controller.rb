class Admin::StylesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @style.save
      flash[:success] = "Style #{@style.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @style.update_attributes(style_params)
      flash[:success] = "Style #{@style.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @style.destroy
    flash[:success] = 'Style was deleted!'
    redirect_to action: 'index'
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end
end