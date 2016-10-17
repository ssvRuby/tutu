class RoutesController < ApplicationController
  before_action :set_train_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(train_route_params)
    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(train_route_params)
      redirect_to @route
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private

  def set_train_route
    @route = Route.find(params[:id])
  end

  def train_route_params
    params.require(:route).permit(:title, railway_station_ids: [])
  end

end