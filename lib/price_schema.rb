class PriceSchema

  def initialize weekday_rates_for_regular_customer, weekday_rates_for_rewards_customer, weekend_rates_for_regular_customer, weekend_rates_for_rewards_customer
    @price_structure = {
        regular: {
            weekday: weekday_rates_for_regular_customer,
            weekend: weekend_rates_for_regular_customer
        },
        rewards: {
            weekday: weekday_rates_for_rewards_customer,
            weekend: weekend_rates_for_rewards_customer
        }
    }
  end

  def price customer_type, day
    @price_structure[customer_type.to_sym][day_type(day).to_sym]
  end

  private

  def day_type day
    weekdays = ['mon', 'tues', 'wed', 'thur', 'fri']
    weekends = ['sat', 'sun']
    if weekdays.include? day
      return 'weekday'
    elsif weekends.include? day
      return 'weekend'
    else
      raise("Day format is not valid!")
    end
  end

end