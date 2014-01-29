require_relative '../lib/price_schema'

describe PriceSchema do
  let(:price_schema) { PriceSchema.new(110, 80, 90, 80) }

  context 'should get correct price for regular customer on' do
    it('weekday') do
      expect(price_schema.price('regular', 'mon')).to eql(110)
    end

    it('weekend') do
      expect(price_schema.price('regular', 'sat')).to eql(90)
    end
  end

  context 'should get correct price for rewards customer on' do
    it('weekday') do
      expect(price_schema.price('rewards', 'tues')).to eql(80)
    end

    it('weekend') do
      expect(price_schema.price('rewards', 'sun')).to eql(80)
    end
  end

  context 'should raise error' do
    it 'when day format is not valid' do
      expect{price_schema.price('rewards', 'invalid day')}.to raise_error('Day format is not valid!')
    end
  end
end