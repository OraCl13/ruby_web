class Admin::RoutsController < Admin::BaseController
  before_action :set_rout, only: %i[ show edit update destroy ]
  before_action :find_all_trains, only: %i[ show ]

  def index
    @routs = Rout.all
  end

  def show
  end

  def new
    @rout = Rout.new
  end

  def edit
  end

  def create
    @rout = Rout.new(rout_params)
    respond_to do |format|
      if @rout.save
        format.html { redirect_to admin_routs_url, notice: "Route was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rout.update(rout_params)
        format.html { redirect_to admin_routs_url, notice: "Route was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rout.destroy

    respond_to do |format|
      format.html { redirect_to admin_routs_url, notice: "Route was successfully destroyed." }
    end
  end

  private
  def set_rout
    @rout = Rout.find(params[:id])
  end

  def rout_params
    params.require(:rout).permit(:name, railway_station_ids: [])
  end

  def find_all_trains
    @trains_for_rout = Train.where(rout_id: params[:id])
  end
end
