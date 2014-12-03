class Admin::YearsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @year.save
      flash[:success] = "Year #{@year.name} was created!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @year.update_attributes(year_params)
      flash[:success] = "Year #{@year.name} was updated!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @year.destroy
    flash[:success] = 'Year was deleted!'
    redirect_to action: 'index'
  end

  private

  def year_params
    params.require(:year).permit(:name)
  end
end