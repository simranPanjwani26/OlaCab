class BookingsController < ApplicationController
  #require 'date'
  #Time.zone = 'Indian Standard Time (IST)'
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new   
    @booking = Booking.new   
  end  

  def edit
    @booking = Booking.find(params[:id])
  end

  def create   
    @booking = Boooking.new(booking_params)   
      if @booking.save   
        flash[:notice] = 'booking added!'   
        redirect_to root_path   
      else   
        flash[:error] = 'Failed to add boooking'   
        render :new   
      end  
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      flash[:success] = 'Booking was successfully updated.'
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:pick_up_time, :return_time, :booking_status, :booking_price)
    end
  

end
