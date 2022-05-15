# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  return nil if list1.nil? && list2.nil?

  dummy = ListNode.new
  beginning = dummy
  while list1 && list2
    if list1.val > list2.val
      dummy.next = list2
      list2 = list2.next
    else  
      dummy.next = list1
      list1 = list1.next
    end
    dummy = dummy.next
  end
  # Duh. Watched Neetcode video. Can just append the list lmao
  # while list1
  #   dummy.next = list1
  #   list1 = list1.next
  #   dummy = dummy.next
  # end
  # while list2
  #   dummy.next = list2
  #   list2 = list2.next
  #   dummy = dummy.next
  # end
  if list1
    dummy.next = list1
  elsif list2
    dummy.next = list2
  end
  beginning.next
end
