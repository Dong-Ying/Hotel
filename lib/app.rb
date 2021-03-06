require_relative 'file_parser'
require_relative 'hotel_selector'
require_relative 'hotel'
require_relative 'price_schema'
require_relative 'select_schema'

class App

  def run filepath = './input_data.txt'
    hotel_selector = HotelSelector.new(hotels, select_schema)
    select_criteria = FileParser.new.parse filepath
    select_criteria.each_with_index do |select_criterion, index|
      puts
      puts "Best-fit hotels for customer #{index + 1}"
      best_fit_hotels = hotel_selector.select select_criterion[:customer_type], select_criterion[:days]
      best_fit_hotels.each do |hotel|
        puts hotel.name
      end
    end
    puts
  end

  private

  def select_schema
    SelectSchema.new
  end

  def hotels
    hotels = []
    lakewood = Hotel.new 'Lakewood', 3, PriceSchema.new(110, 80, 90, 80)
    bridgewood = Hotel.new 'Bridgewood', 4, PriceSchema.new(160, 110, 60, 50)
    ridgewood = Hotel.new 'Ridgewood', 5, PriceSchema.new(220, 100, 250, 40)
    hotels << lakewood << bridgewood << ridgewood
  end
end