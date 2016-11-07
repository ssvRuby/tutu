class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station,   class_name: 'RailwayStation', foreign_key: :end_station_id

  after_create  :buy_notification
  after_destroy :cancel_notification

  private

  def buy_notification
    TicketMailer.buy_ticket(self).deliver_now
  end

  def cancel_notification
    p self
    TicketMailer.cancel_ticket(self).deliver_now
  end
end
