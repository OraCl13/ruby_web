class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: %i[ show edit update destroy update_position ]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to admin_railway_station_url(@railway_station), notice: "Railway station was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to admin_railway_station_url(@railway_station), notice: "Railway station was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def update_position
    @rout = Rout.find(params[:rout_id])
    @railway_station.update_position(@rout, params[:station_index])
    redirect_to [:admin, @rout]
  end

  def destroy
    @railway_station.destroy

    respond_to do |format|
      format.html { redirect_to admin_railway_stations_url, notice: "Railway station was successfully destroyed." }
    end
  end

  private
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end

    def param_routs_to_add
      params.require(:railway_station).permit(:rout)
    end
end
