class Carriage < ApplicationRecord
  belongs_to :train

  before_validation  :set_carriage_number

  validates :number, presence:  true
  validates :number, uniqueness: { scope: :train_id }

  CARRIAGE_TYPES = ['Coupe', 'Economy', 'SV', 'Seating']

  def self.carriage_types
    CARRIAGE_TYPES
  end

  protected

  def set_carriage_number
    #--------------------------------------------------------------------------
    # Алгоритм присваивания номеров с заполнением разрывов в последовательности
    #--------------------------------------------------------------------------
    # carriage_number = 0
    #
    # carriage_list = train.carriages.order(number: :asc)
    # carriage_number = 1 if carriage_list.length == 0
    #
    # if carriage_number == 0
    #   for i in 0 .. carriage_list.length-1 do
    #     number_present = carriage_list.detect { |c| c.number == i + 1 }
    #     if number_present.nil?
    #       carriage_number = i + 1
    #       break
    #     end
    #   end
    # end
    #
    # carriage_number = carriage_list.last.number + 1 if carriage_number == 0
    # self.number = carriage_number
    
    carriage_max_number = train.carriages.maximum(:number)
    carriage_max_number = 0 if carriage_max_number.nil?
    self.number = carriage_max_number + 1
  end

end
