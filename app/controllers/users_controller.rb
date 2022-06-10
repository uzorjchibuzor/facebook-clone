# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_only

  def index
    @users = User.all.paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def search
    @users = User.where(first_name: search_params[:first_name]).or(User.where(last_name: search_params[:first_name])).or(User.where(email: search_params[:first_name]))
    if !@users.empty?
      flash.now[:success] = 'User(s) found'
    else
      flash.now[:warning] = 'Not found'
    end
  end

  def all_friends
    @direct_friendships  = Friendship.where(friend_id: current_user.id).where(status: 'active').map(&:user_id)

    @inverse_friendships = Friendship.where(user_id: current_user.id).where(status: 'active').map(&:friend_id)

    all_friends_ids = @direct_friendships.concat(@inverse_friendships)

    @friends = User.where(id: all_friends_ids).paginate(page: params[:page], per_page: 10)
  end

  def notifications
    @pending_friendships = Friendship.where(friend_id: current_user.id).filter do |friendship|
      friendship.status == 'pending'
    end
  end

  private

  def search_params
    params.require(:user).permit(:first_name)
  end
end
