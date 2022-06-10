class LikesController < ApplicationController
  def new
  end

  def create

    @like = current_user.likes.build(likeable_id: params[:likeable_id],likeable_type: params[:likeable_type])
    if @like.save
     
    else
    flash[:warning] = "Error occured"
    end
    redirect_back(fallback_location: authenticated_root_url)
  end

  def destroy
    current_user.likes.where(likeable_id: params[:likeable_id]).find_by(likeable_type: params[:likeable_type]).destroy
    redirect_back(fallback_location: authenticated_root_url)
  end

  private


end
