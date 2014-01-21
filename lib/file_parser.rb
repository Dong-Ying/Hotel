class FileParser
  def parse filepath = './input_data.txt'
    search_criteria = []
    File.readlines(filepath).each do |line|
      customer_type = line.split(":").first.downcase!
      days = get_days line.split(":").last
      search_criteria << {
          customer_type: customer_type,
          days: days
      }
    end
    search_criteria
  end

  def get_days days_info
    result = []
    days = days_info.split(',')
    days.each do |day|
      day.match(/\((\w*)\)/) { |match_data| result << match_data[1] }
    end
    result
  end
end