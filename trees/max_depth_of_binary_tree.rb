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
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?
  return 1 if root.left.nil? && root.right.nil?

  left =  1 + max_depth(root.left)
  right = 1 + max_depth(root.right)
  left > right ? left : right
end
