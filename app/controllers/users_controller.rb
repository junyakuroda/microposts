class UsersController < ApplicationController
  # 課題のため
 before_action :set_user, only: [:show, :edit, :update, :destroy]
  #課題のため　ここまで
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
  
  #ここから課題のための追記
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end
  
  
  #ここまで課題のための追記
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  #課題のため　ここから
  def set_user
   @user = User.find(params[:id])
  end
  #課題のため　ここまで
  
end

