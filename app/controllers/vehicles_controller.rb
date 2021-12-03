class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :create, :edit, :destroy]

  def index
    @vehicles = Vehicle.paginate(page: params[:page], per_page: 3)
  end
  
  def show 
  end

  def new
    @vehicle = Vehicle.new 
    authorize Vehicle
  end 

  def search
    @pick_up = params[:pick_up]
    @drop = params[:drop]

    pick_up = Geocoder.search(params[:pick_up])
    pick_up_coordinates= pick_up.first.coordinates
    drop = Geocoder.search(params[:drop])
    drop_coordinates = drop.first.coordinates
    @distance = Geocoder::Calculations.distance_between(pick_up_coordinates, drop_coordinates, :units => :km)
    @vehicles = Vehicle.where("vehicles.location LIKE ? ", ["%#{@pick_up}%"])
    
  end

  def edit
    authorize Vehicle
  end

  def create
    authorize Vehicle
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
    authorize Vehicle
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
    authorize Vehicle
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    params[:id] = nil
    flash[:notice] = "Vehicle has been deleted"
    redirect_to :action => :index
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:vehicle_type, :license_number, :vehicle_model, :location, :status, :image, :lat, :Long)
    end
end
