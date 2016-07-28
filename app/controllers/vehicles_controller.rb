class VehiclesController < ApplicationController

  def index
    @user = current_user
    @vehicles = @user.vehicles
    flash[:error] = 'No vehicles registered.' if @vehicles.empty?
  end

  def new
    @user = current_user
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params) ##Asociado al metodo privado vehicle_params, que es el que nos permite crear el nuevo objeto#
    @vehicle.user_id = current_user.id
    if @vehicle.save
      flash[:succes] = 'Vehicle registered succesfully.'
      redirect_to user_vehicles_path(current_user)
    else
      flash[:error] = @vehicle.errors.full.messages.join(',') #. todo modelo de active records tiene habilitado el atributo errors
      render 'new'
    end

  end

  def vehicle_params
    params.require(:vehicle).permit(:user_id, :model, :year, :vin, :id)
  end
  private :vehicle_params

end
