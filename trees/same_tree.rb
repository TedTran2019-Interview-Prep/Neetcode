# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  if p.nil? && q.nil?
    true
  elsif p && q
    (p.val == q.val) &&
      is_same_tree(p.left, q.left) &&
      is_same_tree(p.right, q.right)
  else
    false
  end
end
