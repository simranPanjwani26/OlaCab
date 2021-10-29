class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
    authorize User
  end

  def show
  end

  def edit    
      authorize User
  end   

  def new
    @user =User.new
  end

  def update 
    authorize User  
    @user = User.find(params[:id])   
    if @user.update_attributes(user_params)   
      flash[:notice] = 'User updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit user!'   
      render :edit   
    end   
  
  end   

  def destroy
    authorize User   
    @user = User.find(params[:id])   
    if @user.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this user!'   
      render :destroy   
    end   
  end   

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :first_name, :last_name, :phone_no, :email, :password, :password_confirmation)
  end
end
