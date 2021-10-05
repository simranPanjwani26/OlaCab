class AddressController < ApplicationController
  def index
    @addresses = Address.all
  end

  def show   
    @address = Address.find(params[:id])   
  end   
    
  def new   
    @address = Address.new   
  end   
  
  def create   
    @address = Address.new(address_params)   
      if @address.save   
        flash[:notice] = 'Address added!'   
        redirect_to root_path   
      else   
        flash[:error] = 'Failed to edit Address!'   
        render :new   
      end   
  end 
  
  def edit   
    @address = Address.find(params[:id])   
  end  

  def update   
    @address = Address.find(params[:id])   
    if @address.update_attributes(address_params)   
      flash[:notice] = 'Address updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit address!'   
      render :edit   
    end   
  end   

  def destroy   
    @address = Address.find(params[:id])   
    if @address.delete   
      flash[:notice] = 'Address deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this Address'   
      render :destroy   
    end   
  end   

end
