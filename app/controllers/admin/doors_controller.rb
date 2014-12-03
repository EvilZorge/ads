class Admin::DoorsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @door.save
      flash[:success] = "Door #{@door.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @door.update_attributes(door_params)
      flash[:success] = "Door #{@door.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @door.destroy
    flash[:success] = 'Door was deleted!'
    redirect_to action: 'index'
  end

  private

  def door_params
    params.require(:door).permit(:name)
  end
end