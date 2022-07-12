class TicketsController < ApplicationController
  before_action :find_train, only: [ :new,:create ]
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
  end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = User.last
    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket created'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name, :user_passport,
                                   :base_station_id, :end_station_id)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end
end