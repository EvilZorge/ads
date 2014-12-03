class Admin::ModelsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @model.save
      flash[:success] = "Model #{@model.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @model.update_attributes(model_params)
      flash[:success] = "Model #{@model.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @model.destroy
    flash[:success] = 'Model was deleted!'
    redirect_to action: 'index'
  end

  private

  def model_params
    params.require(:model).permit(:name, :make_id)
  end
end