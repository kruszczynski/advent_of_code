require 'digest/md5'

class HashFinder
  INPUT = 'yzbqklnj'.freeze
  BEGINNING = '00000'.freeze

  def initialize
    iterator.each do |i|
      coin_hash = calculate_hash(i)
      if correct?(coin_hash)
        puts i
        break
      end
    end
  end

  private

  def iterator
    Enumerator.new do |yielder|
      number = 0
      loop do
        number += 1
        yielder.yield number
      end
    end
  end

  def calculate_hash(num)
    Digest::MD5.hexdigest(INPUT + num.to_s)
  end

  def correct?(hash)
    hash[0...5] == BEGINNING
  end
end

HashFinder.new
