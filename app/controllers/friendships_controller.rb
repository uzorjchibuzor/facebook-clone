class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.create(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend request sent"
      redirect_back(fallback_location: root_url)
  end

  def update
  end

  def destroy
    current_user.friendships.find(params[:id]).destroy
  end
end
