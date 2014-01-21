class Hotel
  attr_reader :name, :rating

  def initialize name, rating, price_schema
    @name = name
    @rating = rating
    @price_schema = price_schema
  end

  def price customer_type, days
    total_price = 0
    days.each do |day|
      total_price += @price_schema.price(customer_type, day)
    end
    total_price
  end
end