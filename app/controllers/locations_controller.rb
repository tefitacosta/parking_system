class LocationsController <ApplicationController
  def index
    @locations = Location.all
    flash[:error] = 'No locations registered.' if @locations.empty?
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params) ##Asociado al metodo privado vehicle_params, que es el que nos permite crear el nuevo objeto#
    if @location.save
      flash[:succes] = 'Location registered succesfully.'
      redirect_to  locations_path
    else
      flash[:error] = @location.errors.full_messages.join(',') #. todo modelo de active records tiene habilitado el atributo errors
      render 'new'
    end

  end

  def location_params
    params.require(:location).permit(:id, :name, :latitude, :longitude, :address, :max_slots, :description)
  end
  private :location_params

end
