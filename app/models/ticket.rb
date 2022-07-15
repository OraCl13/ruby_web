class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :base_station, class_name: 'RailwayStation', foreign_key: :base_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  after_create :send_notification_create
  after_destroy :send_notification_delete
  def rout_name
    "#{base_station.title} - #{end_station.title}"
  end
  private

  def send_notification_create
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_delete
    TicketsMailer.delete_ticket(self.user).deliver_now
  end
end
