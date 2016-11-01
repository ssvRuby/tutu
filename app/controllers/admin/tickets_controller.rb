class Admin::TicketsController < Admin::BaseController
  before_action :addition_params, only: [:new]
  before_action :set_ticket, only: [:show, :destroy, :update, :edit]

  def show
  end

  def index
    @tickets = Ticket.all
  end

  def create
      @ticket = current_user.tickets.new(ticket_params)

      if @ticket.save
        redirect_to admin_ticket_path(@ticket), method: :post
      else
        render :show
      end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket)
    else
      render :new
    end
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id],
                         start_station_id: params[:start_station_id],
                         end_station_id: params[:end_station_id])
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passport_number, :user_id)
  end

  def addition_params
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

end
