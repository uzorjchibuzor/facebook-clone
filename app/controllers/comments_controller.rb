class CommentsController < ApplicationController
  before_action :logged_in_only

  def new
    @comment = current_user.comments.build()
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "comment added successfully"
      redirect_back(fallback_location: current_user) 
    else
      flash[:danger] = "Sorry, comment could not be added"
      redirect_back(fallback_location: current_user) 
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
