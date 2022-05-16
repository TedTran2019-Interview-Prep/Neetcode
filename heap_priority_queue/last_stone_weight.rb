# @param {Integer[]} stones
# @return {Integer}
require 'rubygems'
require 'algorithms'
include Containers
# Heap(defaults to MinHeap w/ no block), MinHeap, MaxHeap
# size, push, pop, has_key?, next, next_key, clear, empty?, merge!
# change_key, delete, max/max!, min/min!
# Kanwei uses a fibonacci-heap implementation 
# Push O(1), Pop O(1), min O(1), delete (log n), merge O(1)
# Why is it so much slower than a regular heap, though...
def last_stone_weight(stones)
  heap = MaxHeap.new
  stones.each { |stone| heap << stone }
  until heap.size <= 1
    stone1 = heap.pop
    stone2 = heap.pop
    if stone1 != stone2
      heap << (stone1 - stone2).abs
    end
  end
  last = heap.pop
  last.nil? ? 0 : last
end
