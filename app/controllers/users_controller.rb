class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @books = @user.books
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    # @post_images = @user.post_images
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to users_path
    end
  end
end
