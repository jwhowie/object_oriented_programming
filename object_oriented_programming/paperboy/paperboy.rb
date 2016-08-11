class Paperboy
    def initialize(name, side)
    @name = name
    @experience = 0.0
    @side = side
    @earnings = 0.0
    @reg_pay = 0.25
    @over_quota_pay = 0.5
    @under_quota_loss = 2.0
    @min_papers = 50
   end

  def quota
    return (@experience / 2.0) + @min_papers
  end

  def deliver(start_address, end_address)
    deliveries = 0
    if start_address < end_address
      deliveries = (end_address - start_address) / 2
    else
      deliveries = (start_address -  end_address) / 2
    end
    if deliveries % 2 != 0
      deliveries.floor
      deliveries += 1
    end
    pay = 0
    if deliveries < quota()
      pay = deliveries * @reg_pay - @under_quota_loss
    elsif deliveries > quota()
      pay = quota * @reg_pay
      pay += (deliveries - quota) * @over_quota_pay
    else
      pay = quota * @reg_pay
    end
    @earnings += pay
    @experience += deliveries
    return pay
  end

  def earnings
    @earnings
  end

  def report
    return "I'm #{@name}, Ive delivered #{@experience.round(0)} and I've earned $#{@earnings.round(2)}"
  end


end

tommy = Paperboy.new("Tommy", "even")

puts tommy.quota # => 50
puts tommy.deliver(101, 220) # => 17.75
puts tommy.earnings #=> 17.5
puts tommy.report # => "I'm Tommy, I've delivered 60 papers and I've earned $17.5 so far!"

puts tommy.quota # => 80
puts tommy.deliver(1, 150) # => 18.75
puts tommy.earnings #=> 36.25
puts tommy.report # => "I'm Tommy, I've been delivered 134 papers and I've earned $36.25 so far!"
