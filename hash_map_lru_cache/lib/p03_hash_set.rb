class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    unless include?(key)
      self[key] << key 
      @count += 1
    end
    key
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
    key
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    temp_store = @store.dup
    @store = Array.new(new_num_buckets) { Array.new }
    @count = 0
    
    temp_store.each do |bucket|
      bucket.each do |el|
        self.insert(el)
      end
    end
    @store
  end
end
