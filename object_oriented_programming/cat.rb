class Cat
  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  def eats_at
    meridiam = "AM"
    hour = @meal_time
    if @meal_time > 12
      meridiam = "PM"
      hour = @meal_time - 12
    end
    return "#{hour} #{meridiam}"
  end

  def meow
    return "My name is #{@name} and I eat #{@preferred_food} at #{eats_at}"
  end
end


dave = Cat.new("Dave", "Puriena", 11)
socks = Cat.new("Socks", "Puriena", 18)

puts dave.meow
puts socks.meow
