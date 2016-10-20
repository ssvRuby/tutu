class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence:  true

  CARRIAGE_TYPES = ['Coupe', 'Economy']

  def self.carriage_types
    CARRIAGE_TYPES
  end

end
