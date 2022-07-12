class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def search
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    @routs = Rout.search_for_routs(@start_station, @end_station)
    puts @routs.length
    puts 'x'*200
  end
end