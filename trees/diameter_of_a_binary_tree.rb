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
def diameter_of_binary_tree(root)
  $max = 0
  max_height = diameter(root)
  $max > max_height ? $max : max_height
end

def diameter(root)
  return -1 if root.nil?

  left = 1 + diameter(root.left)
  right = 1 + diameter(root.right)
  diameter = left + right
  $max = diameter if diameter > $max

  left > right ? left : right
end
