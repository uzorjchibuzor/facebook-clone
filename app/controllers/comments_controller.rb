class CommentsController < ApplicationController
  def new
    @comment = current_user.comment.build()
  end

  def create
    @comment = current_user.comment.build(comment_params)
    if @comment.save
      flash[:success] = "comment added successfully"
      redirect_back(fallback_location: current_user) 
    else
      flash.now[:danger] = "Sorry, comment could not be added"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
