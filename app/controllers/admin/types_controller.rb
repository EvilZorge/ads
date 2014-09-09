class Admin::TypesController < ApplicationController
  load_and_authorize_resource

  def index
    @types = Type.all
  end

  def show
  end

  def new
  end

  def create
    if @type.save
      flash[:success] = "Type #{@type.name} was created!"
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @type.update_attributes(type_params)
      flash[:success] = "Type #{@type.name} was updated!"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    if @type.destroy
      flash[:success] = 'Type was deleted!'
      redirect_to action: 'index'
    else
      flash[:fail] = 'Something wrong'
      redirect_to action: 'index'
    end
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end
end
