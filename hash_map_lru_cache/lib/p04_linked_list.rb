class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = self.next
    @next.prev = self.prev
  end
end



class LinkedList
  attr_reader :store
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    if empty?
      @head.next = node
      @tail.prev = node
      node.next = @tail
      node.prev = @head
    else
      node.prev = @tail
      @tail.prev = node
      node.next = @tail
    end
  end

  def update(key, val)
    current_node = first
    until current_node.key == key
      current_node.val = val
      current_node = current_node.next
    end
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
