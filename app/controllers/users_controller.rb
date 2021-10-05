class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(param[:id])
  end

  def new
    @user = User.new 
  end

  def create
    @user =  User.new(user_params)
    if @user.save!
      flash[:notice] = 'User added!'
      redirect_to root_path
      else
        render :new
    end
  end

  def edit   
    @user = User.find(params[:id])   
  end   

  def update   
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
    @user = User.find(params[:id])   
    if @user.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this user!'   
      render :destroy   
    end   
  end   
end
