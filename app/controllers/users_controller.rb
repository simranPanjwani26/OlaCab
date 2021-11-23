class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :create, :edit, :destroy]
  def index
    byebug
    # @users = User.all
    authorize User
    @users = User.paginate(page: params[:page], per_page: 5)

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
        
    if @user.update(user_params)   
      flash[:notice] = 'User updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit user!'   
      render 'edit'  
    end   
  
  end   

  def destroy
    authorize User   
    
    if @user.destroy  
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
