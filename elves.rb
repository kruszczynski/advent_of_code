class Elves
  def initialize
    @total_area = 0
    @present_sizes = File.read('data/present_sizes.txt').lines
  end

  def call
    @present_sizes.each do |present_size|
      calculate_packing(present_size)
    end
    @total_area
  end

  def calculate_packing(size)
    sorted = size.split('x').map(&:to_i).sort
    # first combination is the smallest side
    sorted.combination(2).each_with_index do |combination, index|
      area = combination.reduce(:*)
      multiplier = index == 0 ? 3 : 2
      @total_area += area * multiplier
    end
  end
end

elv = Elves.new
puts elv.call
