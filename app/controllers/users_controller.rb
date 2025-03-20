class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def mypage
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to ユーザーの詳細ページへのパス  
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
