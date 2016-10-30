class TicketsController < ApplicationController
  before_action :addition_params, only: [:new]

  def show
  end

  def create
      @ticket = Ticket.new(ticket_params)

      if @ticket.save
        redirect_to @ticket
      else
        render :show
      end
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id],
                         start_station_id: params[:start_station_id],
                         end_station_id: params[:end_station_id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passport_number)
  end

  def addition_params
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

end
