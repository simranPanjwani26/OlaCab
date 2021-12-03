class BookingsController < ApplicationController
  
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :create, :edit, :destroy]
  
  def index
    @bookings = Booking.paginate(page: params[:page], per_page: 8)
    respond_to do |format|
      format.html
      format.pdf do
        render template: "bookings/index.html.erb",
          pdf: "Bookings: #{@bookings.count}"
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render template: "bookings/show.html.erb",
          pdf: "Booking ID: #{@booking.id}"
      end
    end
  end

  def new 
   @booking = Booking.new(pick_up: params[:pick_up], drop: params[:drop], distance: params[:distance], vehicle_id: params[:vehicle_id])  
    @booking.user = current_user
    authorize Booking 
  end  

  def edit
    authorize Booking
  end

  def create 
    authorize Booking 
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    distance = booking_params[:distance]
    @booking.booking_price = distance.to_i * 5
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
    # byebug
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
