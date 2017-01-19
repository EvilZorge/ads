class Admin::AdvertismentsController < ApplicationController
  load_and_authorize_resource


  def index
  end

  def show
  end

  def moderation
    @advertisments = Advertisment.where(state: 'new')
  end

  def search
    @advertisments = Advertisment.where("title ILIKE :title AND state = :state", title: "%#{params[:search]}%", state: params[:state])
    render :index
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

  def change_state
    if @advertisment.fire_state_event(params[:state_status])
      flash[:success] = "Advertisment's state was changed to #{@advertisment.state}!"
      redirect_to action: 'index'
    else
      flash[:error] = 'Something wrong'
      render 'show'
    end
  end

  def multiple_change_state
    if params[:advertisment_ids]
      @advertisments = Advertisment.find(params[:advertisment_ids])
      @advertisments.each do |advertisment|
        advertisment.fire_state_event(params[:state_status])
      end
      flash[:success] = "Updated advertiments!"
      redirect_to action: 'moderation'
    else
      flash[:error] = 'Check your params'
      redirect_to :back
    end
  end

  private

  def advertisment_params
    params.require(:advertisment).permit(:ban_reason, :state)
  end

end
