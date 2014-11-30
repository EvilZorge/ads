class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    @advertisment = Advertisment.find(params[:advertisment_id])
    @comment = Comment.new
  end

  def create 
    @comment.advertisment_id = params[:advertisment_id]
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment was created!"
      redirect_to @comment.advertisment
    else
      flash[:error] = 'Something wrong'
      render 'new'
    end
  end

  def edit
    @advertisment = Advertisment.find(params[:advertisment_id])
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment was updated!"
      redirect_to :back
    else
      flash[:error] = 'Something wrong'
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment was deleted!'
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:advertisment_id,:user_id)
  end
end