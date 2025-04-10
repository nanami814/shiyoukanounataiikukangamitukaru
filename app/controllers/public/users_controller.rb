class Public::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def mypage
    @user = current_user
    @posts = @user.posts
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "mypage"
    end
  end


  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
