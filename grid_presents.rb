directions = File.read('data/santa_directions.txt')

class House
  attr_reader :x, :y, :visits_count

  def initialize(x, y)
    @x = x
    @y = y
    @visits_count = 1
  end

  def visit
    @visits_count += 1
  end

  def ==(other)
    @x == other.x && @y == other.y
  end
end

class Grid
  UP = '^'
  DOWN = 'v'
  LEFT = '<'
  RIGHT = '>'

  def initialize
    @x = 0
    @y = 0
    @visited = [House.new(@x, @y)]
  end

  def move(direction)
    update_position(direction)
    give_present
  end

  def count_multiples
    @visited.count { |house| house.visits_count > 1 }
  end

  private

  def update_position(direction)
    case direction
    when UP
      @y += 1
    when DOWN
      @y -= 1
    when LEFT
      @x -= 1
    when RIGHT
      @x += 1
    end
  end

  def give_present
    new_house = House.new(@x, @y)
    @visited.push(new_house) unless @visited.include?(new_house)

    @visited.find { |house| house == new_house }.visit
  end
end

class Giveaway
  def initialize
    @grid = Grid.new
  end

  def traverse(directions)
    directions.each_char do |direction|
      @grid.move direction
    end
    puts @grid.count_multiples
  end
end

g = Giveaway.new
g.traverse(directions)
