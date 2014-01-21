require_relative '../lib/hotel'
require_relative '../lib/price_schema'

describe Hotel do
  subject(:hotel) { Hotel.new("Lakewood", 3, PriceSchema.new(110, 80, 90, 80)) }

  its(:name) { should eql("Lakewood") }
  its(:rating) { should eql(3) }

  context 'should get correct price for regular customer' do
    it 'on weekday' do
      expect(hotel.price('regular', ['thur'])).to eql(110)
    end

    it 'on weekend' do
      expect(hotel.price('regular', ['sat'])).to eql(90)
    end

    it 'on weekdays and weekends' do
      expect(hotel.price('regular', ['mon', 'wed', 'fri', 'sat'])).to eql(420)
    end
  end

  context 'should get correct price for rewards customer' do
    it 'on weekday' do
      expect(hotel.price('rewards', ['fri'])).to eql(80)
    end

    it 'on weekend' do
      expect(hotel.price('rewards', ['sun'])).to eql(80)
    end

    it 'on weekdays and weekends' do
      expect(hotel.price('rewards', ['mon', 'wed', 'fri', 'sat'])).to eql(320)
    end
  end
end