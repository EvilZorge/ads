class Admin::AdvertismentsController < ApplicationController
  load_and_authorize_resource

  def index
    @advertisments = Advertisment.all
  end

  def moderation
    @advertisments = Advertisment.where(state: ['new'])
  end

  def search
    @advertisments = Advertisment.search(params[:search], conditions: { type: params[:type], state: params[:state]},
      star: true)
    render :index
  end

end
