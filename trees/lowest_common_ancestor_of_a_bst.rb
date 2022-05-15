# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
# It's a binary SEARCH tree
# Split or if it's the node itself == LCA
# If not a split, go into the necessary subtree and recalculate
def lowest_common_ancestor(root, p, q)
  return root if root.val == p.val || root.val == q.val
  return root if root.val.between?(p.val, q.val) || root.val.between?(q.val, p.val)

  if root.val > p.val
    lowest_common_ancestor(root.left, p, q)
  else
    lowest_common_ancestor(root.right, p, q)
  end
end
