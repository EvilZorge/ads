class AdvertismentsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :index

  def index
    @advertisments = Advertisment.where(state:"published")
  end

  def show
  end

  def new
  end

  def create
    if @advertisment.save
      flash[:success] = "Advertisment #{@advertisment.title} was created!"
      redirect_to @advertisment
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def search
    @advertisments = Advertisment.search(params[:search], conditions: { type: params[:type], state: 'published' },
      star: true)
      render :index
  end

  def edit
  end

  def update
    if @advertisment.update_attributes(advertisment_params)
      flash[:success] = "Advertisment #{@advertisment.title} was updated!"
      redirect_to @advertisment
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @advertisment.destroy
    flash[:success] = 'Advertisment was deleted!'
    redirect_to action: 'index'
  end

  def change_state
    if @advertisment.fire_state_event(params[:state_status])
      flash[:success] = "Advertisment's state was changed to #{@advertisment.state}!"
      redirect_to :back
    else
      flash[:error] = 'Something wrong'
      render 'show'
    end
  end

  private

  def advertisment_params
    params.require(:advertisment).permit(:title, :body, :type_id, :user_id, ads_images_attributes: [:id, :photo, :_destroy])
  end
end
