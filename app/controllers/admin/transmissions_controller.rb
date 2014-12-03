class Admin::TransmissionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @transmission.save
      flash[:success] = "Transmission #{@transmission.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @transmission.update_attributes(transmission_params)
      flash[:success] = "Transmission #{@transmission.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @transmission.destroy
    flash[:success] = 'Transmission was deleted!'
    redirect_to action: 'index'
  end

  private

  def transmission_params
    params.require(:transmission).permit(:name)
  end
end