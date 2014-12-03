class Admin::FeaturesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @feature.save
      flash[:success] = "Feature #{@feature.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @feature.update_attributes(feature_params)
      flash[:success] = "Feature #{@feature.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @feature.destroy
    flash[:success] = 'Feature was deleted!'
    redirect_to action: 'index'
  end

  private

  def feature_params
    params.require(:feature).permit(:name)
  end
end