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
# @return {Boolean}
def is_balanced(root)
  $balance = true
  balanced?(root)
  $balance
end

def balanced?(root)
  return -1 if root.nil?

  left_height = 1 + balanced?(root.left)
  right_height = 1 + balanced?(root.right)
  $balance = false if (left_height - right_height).abs > 1

  left_height > right_height ? left_height : right_height
end
