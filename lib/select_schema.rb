class SelectSchema
  def select hotels, customer_type, days
    sorted_hotels = hotels.sort_by { |hotel| [hotel.price(customer_type, days), -hotel.rating] }
    best_fit_hotel = sorted_hotels.first
    sorted_hotels.select do |hotel|
      hotel.price(customer_type, days) == best_fit_hotel.price(customer_type, days) && hotel.rating == best_fit_hotel.rating
    end
  end
end
