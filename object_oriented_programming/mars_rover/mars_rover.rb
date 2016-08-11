class Mars
  def initialize(x, y)
    @grid = Array.new(x, y)
    @rovers = []
  end

  def add_rover(x, y, direction)
    @rovers.push(Rover.new(x, y, direction))
  end

  def move_rover(move_string)
    if @rovers.count > 0
        puts @rovers.last.move(move_string)
    end
  end
end

class Rover
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction_array = ['N', 'E', 'S', 'W']
    @direction = @direction_array.index(direction)
  end

  def move(move_string)
    move_array = move_string.split(//)
    move_array.each do |command|
      move_rover(command)
    end
    return "#{@x} #{@y} #{@direction_array[@direction]}"
  end

  def move_rover(command)
    if command == 'L'
      if @direction == 3
        @direction = 0
      else
        @direction += 1
      end
    elsif command == 'R'
      if @direction == 0
        @direction = 3
      else
        @direction -= 1
      end
    else
      if @direction == 0
        @y += 1
      elsif @direction == 1
        @x += 1
      elsif @direction == 2
        @y -= 1
      else @direction == 3
        @x -= 1
      end
    end
    puts "#{command} #{@x} #{@y} #{@direction_array[@direction]} #{@direction}"
  end

end

mars = Mars.new(5,5)
mars.add_rover(1, 2, 'N')
puts mars.move_rover('LMLMLMLMM')


puts ' '

mars.add_rover(3, 3, 'E')
puts mars.move_rover('MMRMMRMRRM')
