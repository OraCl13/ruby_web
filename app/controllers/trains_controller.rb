class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to train_url(@train), notice: "Train was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to train_url(@train), notice: "Train was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: "Train was successfully destroyed." }
    end
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      values = params.require(:train).permit(:number, :current_station, :rout, :order_van)
      values['current_station'] = find_station_by_id(values['current_station'])#number_field
      values['rout'] = find_rout_by_id(values['rout'])#number_field
      values
    end

    def find_station_by_id(id)
      RailwayStation.find(id)
    end

    def find_rout_by_id(id)
      Rout.find(id)
    end
end
