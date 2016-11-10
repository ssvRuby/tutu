class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

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
      redirect_to admin_route_path(@route)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(train_route_params)
      # redirect_to admin_route_path(@route)
      redirect_to admin_routes_path(@route)
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def train_route_params
    params.require(:route).permit(:title, railway_station_ids: [], train_ids: [])
  end

end