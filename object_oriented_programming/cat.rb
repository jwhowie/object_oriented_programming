class Cat
  attr_accessor :name, :preferred_food, :meal_time
  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  public
  def eats_at
    meridiam = "AM"
    hour = meal_time
    if meal_time > 12
      meridiam = "PM"
      hour = meal_time - 12
    end
    return "#{hour} #{meridiam}"
  end
end


dave = Cat.new("Dave", "Puriena", 11)
socks = Cat.new("Socks", "Puriena", 18)

puts dave.name
puts dave.preferred_food
puts dave.eats_at
puts socks.eats_at
