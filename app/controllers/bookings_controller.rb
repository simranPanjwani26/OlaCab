class BookingsController < ApplicationController
  #require 'date'
  #Time.zone = 'Indian Standard Time (IST)'
  # skip_before_action :verify_authenticity_token
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :create, :edit, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new   
    @booking = Booking.new(pick_up: params[:pick_up], drop: params[:drop], distance: params[:distance])  
    authorize Booking 
  end  

  def edit
    authorize Booking
  end

  def create  
    authorize Booking 
    @booking = Booking.new(booking_params)
    
    @booking.update(user_id: @current_user.id)
    # @booking.update(vehicle_id: @vehicle.id)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
      
  end

  def update
    authorize Booking
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      flash[:success] = 'Booking was successfully updated.'
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    authorize Booking
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
      params.require(:booking).permit(:user_id, :vehicle_id, :pick_up_time, :return_time, :booking_status, :booking_price, :pick_up, :drop, :distance)
    end
  

end
