class UsersController < ApplicationController
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
end
