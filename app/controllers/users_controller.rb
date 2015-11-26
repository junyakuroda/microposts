class UsersController < ApplicationController
 #before_action :set_user, only: [:show, :edit, :update, :destroy]
 
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end
  
 
  
  #ここから課題２
  def followings
     @user = User.find(params[:id])
     @followings = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users
  end
  #ここまで課題２
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :region, :password, :password_confirmation)
  end
  
  #課題のため　ここから
  #def set_user
   #@user = User.find(params[:id])
  #end
  #課題のため　ここまで
  
end

