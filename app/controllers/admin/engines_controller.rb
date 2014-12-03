class Admin::EnginesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @engine.save
      flash[:success] = "Engine #{@engine.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @engine.update_attributes(engine_params)
      flash[:success] = "Engine #{@engine.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @engine.destroy
    flash[:success] = 'Engine was deleted!'
    redirect_to action: 'index'
  end

  private

  def engine_params
    params.require(:engine).permit(:name)
  end
end