# frozen_string_literal: true

# Naive exceeds time limit
class KthLargest
  def initialize(k, nums)
    @array = nums.sort { |a, b| b <=> a }
    @k = k
  end

  def add(val)
    slide(val)
    @array[@k - 1]
  end

  private

  def slide(val)
    if @array.empty?
      @array.unshift(val)
      return
    end

    @array.each_with_index do |el, idx|
      if val > el
        @array.insert(idx, val)
        return
      end
    end
    @array.insert(@array.length, val)
  end
end

#############################################
require 'rb_heap'

class KthLargest
  def initialize(k, nums)
    @k = k
    @heap = Heap.new
    nums.each { |num| @heap << num }
    @heap.pop until @heap.size <= @k
  end

  def add(val)
    @heap << val
    @heap.pop until @heap.size <= @k
    @heap.peak
  end
end

kthLargest = KthLargest.new(3, [4, 5, 8, 2])
puts kthLargest.add(3)
puts kthLargest.add(5)
puts kthLargest.add(10)
puts kthLargest.add(9)
puts kthLargest.add(4)
