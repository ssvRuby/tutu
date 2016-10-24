class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence:  true

  def carr_by_type
    c_type = {}
    Carriage.carriage_types.each do |t|
      c_type[t] = 0
      self.carriages.each do |c|
        if c.carriage_type == t.to_s
          c_type[t] += 1
        end
      end
    end
    return c_type
  end

  def places_by_type (carriage_type)
    c_type = {"Верхние места" => 0, "Нижние места" => 0}
    # c_type = {}
    # c_type["Верхние места"] = 0
    # c_type["Нижние места"] = 0
    self.carriages.each do |c|
      if c.carriage_type == carriage_type
        if c.top_places_qty.present?
          c_type["Верхние места"] += c.top_places_qty
        end
        c_type["Нижние места"]  += c.bottom_places_qty unless c.bottom_places_qty.nil?
      end
    end
    return c_type
  end

  def carriage_list
    Carriage.where(train_id: self.id).order(number: self.sort_order ? :asc : :desc)
  end

  def show_count_place_by_type(carriage_type, place_type)
    count = carriages.where(type: carriage_type).sum(place_type)
    count = 0 if count.nil?
  end

end
