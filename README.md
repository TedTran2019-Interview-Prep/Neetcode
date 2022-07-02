# Neetcode
Exercises taken from https://neetcode.io/

## Arrays and Hashing
- Contains Duplicate: O(n)
- Valid Anagram: O(n)
- Two Sum: O(n)
- Group Anagrams: O(n * m)
- Top K Frequent Elements: O(n), bound by max # of occurrences
- Product of Array Except Self: O(n), prefix suffix
- Valid Sudoku: O(n)
- Longest Consecutive Sequence: O(n), check if left neighbor exists

## Two Pointers
- Valid Palindrome: O(n)
- Two Sum 2: O(n), bounding
- 3Sum: O(nlogn), sort(to remove dups) then bound. num + L + R
- Container with Most Water: O(n), bounding.
- Trapping Rain Water: O(n), maxLeft, maxRight.

## Sliding Window
- Best Time to Buy and Sell Stock: O(n), compare min w/ every other value
- Longest Substring Without Repeating Characters: O(n), sliding window.
- Longest Repeating Character Replacement: O(n), sliding window. 

## Stack
- Valid Parentheses: O(n)
- Min Stack: Two stacks OR use tuples

## Binary Search
- Binary Search: O(logn)

## Linked List
- Reverse Linked List: O(n)
- Merge Two Linked Lists: O(n)
- Linked List Cycle: O(n), hashmap or Tortoise and Hare
## Trees
- Invert Binary Tree: O(n)
- Maximum Depth of a Binary Tree: O(n)
- Diameter of a Binary Tree: O(n), store extra info
- Balanced Binary Tree: O(n), store extra
- Same Tree: O(n)
- Subtree of Another Tree: O(n * m)
- Lowest Common Ancestor of a BST: O(logn), Definition of BST

## Tries

## Heap / Priority Queue
- Kth Largest Element in a Stream: O(klogn), MinHeap. 
- Last Stone Weight: MaxHeap

## Backtracking

## Graphs
- Number of Islands: O(n), flood fill.

## Advanced Graphs

## 1D Dynamic Programming
- Climbing Stairs: O(n), DP.
- Min Cost Climbing Stairs: O(n), bottom-up DP.

## 2D Dynamic Programming

## Greedy

## Intervals

## Math and Geometry

## Bit Manipulation
- Single Number: O(n), xor. 
- Number of 1 Bits: Converting to string, modulo to check odd/even + bitshifting, 
utilizing &(n - 1)
- Counting Bits: O(n). DP, most significant bit. 
- Reverse Bits: O(1). Bit manipulation fundamentals put together.
- Missing Number: O(n), can use Gauss summation
- Sum of Two Integers: Carries, mask.
- Reverse Integer: Reversing all but last digit and checking if safe.