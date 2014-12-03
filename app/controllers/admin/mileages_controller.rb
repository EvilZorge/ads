class Admin::MileagesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @mileage.save
      flash[:success] = "Mileage #{@mileage.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @mileage.update_attributes(mileage_params)
      flash[:success] = "Mileage #{@mileage.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @mileage.destroy
    flash[:success] = 'Mileage was deleted!'
    redirect_to action: 'index'
  end

  private

  def mileage_params
    params.require(:mileage).permit(:name)
  end
end