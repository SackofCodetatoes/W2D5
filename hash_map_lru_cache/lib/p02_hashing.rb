class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |el, index|
      sum += el.to_s.ord.hash * (index + 1)
    end
    sum
  end
end

class String
  def hash
    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_me = self.sort_by {|k,v| k}.to_a << "hash"
    hash_me.flatten.hash
    # 0
  end
end
