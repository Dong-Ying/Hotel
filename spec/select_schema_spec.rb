require_relative '../lib/select_schema'

describe SelectSchema do

  before(:each) do
    @hotels = []
    @hotel_1 = double("@hotel_1", price: 100, rating: 3)
    @hotel_2 = double("@hotel_2", price: 200, rating: 3)
    @hotels << @hotel_1 << @hotel_2
    @select_schema = SelectSchema.new
  end

  it 'should select cheapest hotel' do
    best_fit_hotel_array = @select_schema.select @hotels, 'regular', 'weekday'
    expect(best_fit_hotel_array).to match_array([@hotel_1])
  end

  it 'should select cheapest hotel with higher rating when there is a tie' do
    hotel_3 = double("hotel_3", price: 100, rating: 4)
    @hotels << hotel_3

    best_fit_hotel_array = @select_schema.select @hotels, 'regular', 'weekday'
    expect(best_fit_hotel_array).to match_array([hotel_3])
  end

  it 'should select multiple hotels if several hotels have the same price and rating which is the best fit' do
    hotel_3 = double("hotel_3", price: 100, rating: 3)
    @hotels << hotel_3

    best_fit_hotel_array = @select_schema.select @hotels, 'regular', 'weekday'
    expect(best_fit_hotel_array).to match_array([@hotel_1, hotel_3])
  end
end