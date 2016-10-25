class CarriagesController < ApplicationController

  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
    @carriage = Carriage.find(params[:id])
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = determine_carriage_class

    if @carriage.save
      redirect_to @carriage.becomes(Carriage)
    else
      render :new
    end
  end



  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage.becomes(Carriage)
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to routes_path
  end

  private

  def determine_carriage_class
    carriage_class_name = 'Carriage' + carriage_params[:carriage_type]
    carriage_class_name.constantize.new(carriage_params)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id, :top_places_qty, :bottom_places_qty, :side_top_places_qty,
                                     :side_bottom_places_qty, :seats_qty, :carriage_type)
  end
end