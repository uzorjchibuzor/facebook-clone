class LikesController < ApplicationController
  def new
  end

  def create
    @like = current_user.likes.build(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type])
    if @like.save
     
    else
    flash[:warning] = "Error occured"
    end
    redirect_back(fallback_location: root_url)
  end

  def destroy
  end

  private


end
