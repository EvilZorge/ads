class Admin::CountriesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @country.save
      flash[:success] = "Country #{@country.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @country.update_attributes(country_params)
      flash[:success] = "Country #{@country.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @country.destroy
    flash[:success] = 'Country was deleted!'
    redirect_to action: 'index'
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end