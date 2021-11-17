class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    # @vehicles =Vehicle.available_vehicles
    # render  json: {status: 'success', vehicles: @vehicles }

    # @vehicles = Vehicle.all
    # @vehicles = Vehicle.search(params[:search])
    @vehicles = Vehicle.paginate(page: params[:page], per_page: 3)
  end
  
  # def book_nearest
   
  #   @vehicle = Vehicle.nearest(params[:loc].to_f, params[:lat].to_f)
  #   if @vehicle.nil?
  #     response = { status: 'failure', message: 'Sorry no cabs are available' }
  #   else
  #     booking = vehicle.book(params[:customer_id], params[:loc], params[:lat])
  #     if booking
  #       response = { status: 'success', vehicle: @vehicle, booking_id: booking.id, message: 'Booking Success' }
  #     else
  #       response = { status: 'failure', message: 'Sorry! Failed to book trip' }
  #     end
  #   end
  #   render json: response
  # end

  def show 
  end

  def new
    @vehicle = Vehicle.new 
  end 

  def search
    # ick_up = params[:pick_up]
    # drop = params[:drop]
    # results = Geocoder.search(params[:pick_up])
    # results.first.coordinates
    @pick_up = params[:pick_up]
    @vehicles = Vehicle.where("vehicles.location LIKE ? ", ["%#{@pick_up}%"])

    # @vehicles = Vehicle.where('location' LIKE? )
    
  end

  
  #   byebug
  #   pick_up= geocoder.search()
  #   drop= geocoder.search()

  #   if pickup.near()== @vehicle.location
  #     format.html { redirect_to @vehicle, notice: "Searching for vehicles" }
  #     format.json { render :search, status: :ok, location: @vehicle }
  #   end
  # end 
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: "New vehicle added!" }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    
    if @vehicle.destroy  
      flash[:notice] = 'Vehicle deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this Vehicle!'   
      render :destroy   
    end   
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:id, :vehicle_type, :license_number, :vehicle_model, :location, :status, :image, :lat, :Long, :search)
    end
end
