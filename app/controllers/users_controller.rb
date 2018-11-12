class UsersController < ApplicationController
  include UsersHelper

  before_action :logged_in_only
  def index
    @users = User.all.paginate(page: params[:page])
  end
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

def all_friends
 # @friends = Friendship.where(friend_id:current_user.id).find_by(status:'active').paginate(page: params[:page])

  @active_friendships  = Friendship.where(friend_id:current_user.id).or(Friendship.where(user_id:current_user.id)).filter{|friendship| friendship.status == 'active'}
end

  def notifications
    @pending_friendships = Friendship.where(friend_id:current_user.id).filter{|friendship| friendship.status == 'pending'}
    
  end

end
