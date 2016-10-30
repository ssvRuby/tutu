class Route < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :title, presence: true
  validate  :station_count

  before_validation :set_title


  private

  def set_title
    self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end


  def station_count
    if railway_stations.size < 2
      errors.add(:base, "Ошибка!  Маршрут должен содержать минимум две станции!")
    end
  end

end
