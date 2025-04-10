class Public::PostsController < ApplicationController
  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/mypage'
  end

  def index
    @posts = 
    @post = Post.preload(:user)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params) 
  end

 

  private

  def post_params
    params.require(:post).permit(:title, :body, :prefectures, :domicile)
  end

end
