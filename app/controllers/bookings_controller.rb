class BookingsController < ApplicationController
  #require 'date'
  #Time.zone = 'Indian Standard Time (IST)'
  skip_before_action :verify_authenticity_token
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new   
    @booking = Booking.new   
  end  

  def edit
  end

  def create   
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
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
