class AddressesController < ApplicationController
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

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
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

  private 
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :country, :pin_code)
  end
end
