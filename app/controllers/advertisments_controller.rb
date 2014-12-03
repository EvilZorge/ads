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
    @resource = resource
    binding.pry
    @advertisment = Advertisment.new()
    if @advertisment.save
      flash[:success] = "Advertisment #{@advertisment.title} was created!"
      redirect_to @advertisment
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
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

  def search
    @advertisments = Advertisment.search(conditions: { title: params[:search], type: params[:type], state: 'published' },
      star: true)
    render :search
  end

  def autocomplete
    if params[:search]
      @advertisments = Advertisment.search( conditions: { title: params[:search], state: 'published' }, star: true, max_matches: 5)
      @advertisments = AdvertismentSerializer.serialize_collection(@advertisments)
      render json: {data: @advertisments}
    end
  end

  def cities_for_select
    if params[:search]
      @cities = Country.find(params[:search]).cities
      render json: {data: @cities}
    end
  end

  def models_for_select
    if params[:search]
      @models = Make.find(params[:search]).models
      render json: {data: @models}
    end
  end

  private

  # def resource
  #   if params[:advertisment][:car]
  #     binding.pry
  #     params[:advertisment][:car] = Car.create(params[:advertisment][:car])
  #   end
  # end 

  def advertisment_params
    params.require(:advertisment).permit(:title, :body, :type_id, :user_id, resource_attributes: [:country_id, :city_id, :make_id, :model_id, :style_id,
     :mileage_id, :year_id, :engine_id, :engine_volume_id, :transmission_id, :door_id, :color_id,:condition_id,:price], ads_images_attributes: [:id, :photo, :_destroy])
  end
end
# resource: [:country_id, :city_id, :make_id, :model_id, :style_id,
#     :mileage_id, :year_id, :engine_id, :engine_volume_id, :transmission_id, :door_id, :color_id, {feature_ids: []}, :price],