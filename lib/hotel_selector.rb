class HotelSelector

  def initialize hotels, hotel_select_schema
    @hotels = hotels
    @hotel_select_schema = hotel_select_schema
  end

  def select customer_type, days
    @hotel_select_schema.select(@hotels, customer_type, days)
  end
end