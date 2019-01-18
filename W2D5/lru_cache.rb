class LRUCache
  attr_reader :cache
  def initialize(size)
    @cache = Array.new
    @size = size
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif @cache.count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end
      # adds element to cache according to LRU principle
  end

  def show
    print @cache
      # shows the items in the cache, with the LRU item first
  end

  private

  # helper methods go here!

  end