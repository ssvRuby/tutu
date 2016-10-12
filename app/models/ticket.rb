class Ticket < ApplicationRecord

  belongs_to :train
  belongs_to :user

  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :end_station,   class_name: 'RailwayStation', foreign_key: :end_station_id

end