class ReviewsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    # @reviews = @user.reviews
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create 
    @review.user = current_user
    @review.assignee_id = params[:user_id]
    if @review.save
      flash[:success] = "Review was created!"
      redirect_to @review.assignee
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
  end

  def update
    if @review.update_attributes(review_params)
      flash[:success] = "Review was updated!"
      redirect_to :back
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'Review was deleted!'
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:body, :assignee_id, :user_id)
  end
end