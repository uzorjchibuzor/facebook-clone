class PostsController < ApplicationController
  def new
    @post = current_user.posts.build()
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Post created successfully"
      redirect_to current_user
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

  private 

    def post_params
      params.require(:post).permit(:content)
    end
end
