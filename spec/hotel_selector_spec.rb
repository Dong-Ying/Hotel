require_relative '../lib/hotel_selector'

describe HotelSelector do
  it 'should select the best fit hotel' do
    hotels = double("hotels")
    best_fit_hotels = double('best_fit_hotels')
    hotel_select_schema = double('hotel_select_schema')
    customer_type = 'regular'
    days = ['mon']
    expect(hotel_select_schema).to receive(:select).with(hotels, customer_type, days).and_return(best_fit_hotels)

    result = HotelSelector.new(hotels, hotel_select_schema).select(customer_type, days)

    expect(result).to equal(best_fit_hotels)
  end
end