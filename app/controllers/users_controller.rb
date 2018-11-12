class UsersController < ApplicationController
  include UsersHelper

  before_action :logged_in_only
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def notifications
    @pending_friendships = Friendship.where(friend_id:current_user.id).filter{|friendship| friendship.status == 'pending'}
    
  end

end
