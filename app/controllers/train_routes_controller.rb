class TrainRoutesController < ApplicationController
  before_action :set_train_route, only: [:show, :edit, :update, :destroy]

  def index
    @train_routes = TrainRoute.all
  end

  def show
  end

  def new
    @train_route = TrainRoute.new
  end

  def create
    @train_route = TrainRoute.new(train_route_params)
    if @train_route.save
      redirect_to @train_route
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @train_route.update(train_route_params)
      redirect_to @train_route
    else
      render :new
    end
  end

  def destroy
    @train_route.destroy
    redirect_to train_routes_path
  end

  private

  def set_train_route
    @train_route = TrainRoute.find(params[:id])
  end

  def train_route_params
    params.require(:train_route).permit(:title)
  end

end