class Admin::ConditionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @condition.save
      flash[:success] = "Condition #{@condition.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @condition.update_attributes(condition_params)
      flash[:success] = "Condition #{@condition.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @condition.destroy
    flash[:success] = 'Condition was deleted!'
    redirect_to action: 'index'
  end

  private

  def condition_params
    params.require(:condition).permit(:name)
  end
end