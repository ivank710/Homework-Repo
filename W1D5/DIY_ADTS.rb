class Stack
  attr_reader :stack_arr

  def initialize
    @stack_arr = []
  end

  def push(el)
    @stack_arr << el
  end

  def pop
    @stack_arr.pop
  end

  def peek
    return @stack_arr.last
  end
end

class Queue
  attr_reader :queue_arr

  def initialize
    @queue_arr = []
  end

  def enqueue(el)
    @queue_arr << el
  end

  def dequeue
    @queue_arr.shift
  end

  def peek
    @queue_arr.first
  end
end

class Map
  #attr_reader :map_arr

  def initialize
    @map_arr = Array.new
  end

  def has_key?(arr, key)
    arr.each do |pair|
      return true if pair.first == key
    end

    false
  end

  def set(key, val)
    exist = has_key?(@map_arr, key)
   
    if exist
      @map_arr.each do |pair|
        if pair.first == key
          pair.last = val
        end
      end
    else
      @map_arr << [key, val]
    end

    @map_arr
  end

  def get(key)
    @map_arr.each do |pair|
      return pair.last if pair.first == key
    end
  end

  def delete(key)
    @map_arr.each_with_index do |pair, idx|
      @map_arr.delete(@map_arr[idx]) if pair.first == key
    end

    @map_arr
  end

  def show
    @map_arr
  end
end

m = Map.new

m.set(1,0)
m.set(2,2)
m.set(3,3)

m.delete(1)

p m.show