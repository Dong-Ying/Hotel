require_relative '../lib/file_parser'

describe FileParser do
  let(:file_parser) {FileParser.new}

  it 'should parse correct search criteria' do
    search_criteria = file_parser.parse 'spec/fixtures/test_input_data.txt'

    expect(search_criteria.length).to eql(3)
    expect(search_criteria[0][:customer_type]).to eql('regular')
    expect(search_criteria[0][:days][0]).to eql('mon')
    expect(search_criteria[0][:days][1]).to eql('tues')
    expect(search_criteria[0][:days][2]).to eql('wed')

    expect(search_criteria[1][:customer_type]).to eql('regular')
    expect(search_criteria[1][:days][0]).to eql('fri')
    expect(search_criteria[1][:days][1]).to eql('sat')
    expect(search_criteria[1][:days][2]).to eql('sun')

    expect(search_criteria[2][:customer_type]).to eql('rewards')
    expect(search_criteria[2][:days][0]).to eql('thur')
    expect(search_criteria[2][:days][1]).to eql('fri')
    expect(search_criteria[2][:days][2]).to eql('sat')
  end

  it 'should raise error when file does not exist' do
    expect{file_parser.parse 'spec/fixtures/invalid_file_path.txt'}.to raise_error('Error happens!')
  end
end