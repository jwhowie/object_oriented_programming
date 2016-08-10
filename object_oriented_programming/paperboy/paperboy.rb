class Paperboy
    def initialize
    @name
    @experience = 0.0
    @side
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
      deliveries = end_address - start_address
    else
      deliveries = start_address -  end_address
    end
    pay = 0
    if deliveries < quota()
      pay = deliveries * @reg_pay - @under_quota_loss
    elsif deliveries > quota()
      pay = @quota * @reg_pay
      pay += (deliveries - @quota) * @over_quota_pay
    else
      pay = quota * @reg_pay
    end
    @earnings += pay
    @experience += deliveries
    return deliveries
  end


end

tommy = Paperboy.new()

puts tommy.deliver(15, 65)
