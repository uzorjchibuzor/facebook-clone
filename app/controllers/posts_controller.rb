class PostsController < ApplicationController
  before_action :logged_in_only

  def index
    @direct_friendships  = Friendship.where(friend_id:current_user.id).where(status: 'active').map{|friendship| friendship.user_id}
   
    @inverse_friendships = Friendship.where(user_id:current_user.id).where(status: 'active').map{|friendship| friendship.friend_id}
   
    all_friends_ids = @direct_friendships.concat(@inverse_friendships) << current_user.id
   
    @posts = Post.where(user_id:all_friends_ids)
  end

  def new
    @post = current_user.posts.build()
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Post created successfully"
      redirect_back(fallback_location: current_user) 
    else
      flash.now[:danger] = "Sorry, post could not be created"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def all_friends
    @direct_friendships  = Friendship.where(friend_id:current_user.id).where(status: 'active').map{|friendship| friendship.user_id}
   
    @inverse_friendships = Friendship.where(user_id:current_user.id).where(status: 'active').map{|friendship| friendship.friend_id}
   
    all_friends_ids = @direct_friendships.concat(@inverse_friendships)
   
    @friends = User.where(id: all_friends_ids).paginate(page: params[:page], per_page: 10)
   end
 

  private 

    def post_params
      params.require(:post).permit(:content,:picture)
    end
end
