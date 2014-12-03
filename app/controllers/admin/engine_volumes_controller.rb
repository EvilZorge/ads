class Admin::EngineVolumesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @engine_volume.save
      flash[:success] = "engine volume #{@engine_volume.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @engine_volume.update_attributes(engine_volume_params)
      flash[:success] = "Engine volume #{@engine_volume.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @engine_volume.destroy
    flash[:success] = 'Engine volume was deleted!'
    redirect_to action: 'index'
  end

  private

  def engine_volume_params
    params.require(:engine_volume).permit(:name)
  end
end