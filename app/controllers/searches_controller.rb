class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def search
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    @routs = @start_station.routs & @end_station.routs
  end
end