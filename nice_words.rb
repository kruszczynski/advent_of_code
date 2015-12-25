class NiceString < String
  VOWELS = %w(a e i o u)
  ILLEGALS = %w(ab cd pq xy)

  def nice?
    vowels? && dups? && !illegals?
  end

  private

  def vowels?
    each_char.count do |char|
      VOWELS.include?(char)
    end > 2
  end

  def dups?
    !!match(/[a-z]*([a-z])\1/)
  end

  def illegals?
    !!match(/(#{ILLEGALS.join('|')})/)
  end
end

lines = File.read('data/words_list.txt').lines
lines.map! { |line| NiceString.new line }
puts lines.count(&:nice?)
