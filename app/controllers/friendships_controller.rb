class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.create(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend request sent"
      redirect_back(fallback_location: authenticated_root_url)
    end
  end

  def update
    @friendship = Friendship.where(friend_id: current_user.id).find_by(user_id: params[:user_id])
    @friendship.status = 'active'
    if @friendship.save
      flash[:notice] = "Request Accepted"
      redirect_back(fallback_location: authenticated_root_url)
    else
      flash[:warning] = "Something Happened"
      redirect_back(fallback_location: authenticated_root_url)
    end
  end

  def destroy
    if current_user.friendships.find_by(friend_id: params[:friend_id])
    current_user.friendships.find_by(friend_id: params[:friend_id]).destroy
    else 
      Friendship.where(friend_id: current_user.id).find_by(user_id: params[:friend_id]).destroy
    end
    redirect_back(fallback_location: root_url)
  end
end
