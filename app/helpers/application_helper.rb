module ApplicationHelper
  def delivery_time_zone_option
    Order::AVAILABLE_DELIVERY_TIME_ZONES.map { |time_zone| [time_zone.gsub('-', '時から').concat('時'), time_zone] }
  end
end
