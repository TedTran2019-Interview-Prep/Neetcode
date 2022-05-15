# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  next_node = nil
  prev_node = nil
  while true
    next_node = head.next
    head.next = prev_node
    prev_node = head
    if next_node.nil? 
      return head
    else
      head = next_node
    end
  end
end

def reverse_list(head)
  return head if head.nil?

  new_head = head
  if head.next
    new_head = reverse_list(head.next)
    head.next.next = head
  end

  head.next = nil
  new_head
end
