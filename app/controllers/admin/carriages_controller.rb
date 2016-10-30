class Admin::CarriagesController < Admin::BaseController

  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create, :index]

  def index
    # @carriages = Carriage.all
    redirect_to [:admin, @train]
  end

  def show
    @carriage = Carriage.find(params[:id])
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to admin_carriage_path(@carriage.becomes(Carriage))
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_carriage_path(@carriage.becomes(Carriage))
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_carriages_path
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

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