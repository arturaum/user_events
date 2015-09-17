class UsersController < ApplicationController
  before_action :proper_user_required, except: [:new, :create] # :index, :show,
  
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, :notice => "Signed up!"
    else
      render action: "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, :notice => "Profile updated!"
    else
      render 'edit'
    end
  end

private

  def user_params
    if params[:user].present?
      params.require(:user).permit(:email, :password, :password_confirmation, :title)
    end   
  end

  def proper_user_required
    user = User.find(params[:id]) if params[:id]
    unless user && current_user && user.id == current_user.id
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_path and return
    end
  end
  
end
