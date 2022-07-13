class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_admin_ticket, only: [:show, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    redirect_to admin_tickets_path, notice: 'Ticket was successfuly deleted'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name, :user_passport,
                                   :base_station_id, :end_station_id)
  end

  def find_admin_ticket
    @ticket = Ticket.find(params[:id])
  end
end
