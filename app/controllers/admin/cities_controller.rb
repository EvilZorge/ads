class Admin::CitiesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @city.save
      flash[:success] = "City #{@city.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @city.update_attributes(city_params)
      flash[:success] = "City #{@city.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @city.destroy
    flash[:success] = 'City was deleted!'
    redirect_to action: 'index'
  end

  private

  def city_params
    params.require(:city).permit(:name, :country_id)
  end
end