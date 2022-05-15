# frozen_string_literal: true

# @param {Character[][]} board
# @return {Boolean}
# 1-9 with  no repetition
# column 1-9 no repeats
# each box 1-9 no repeats
def is_valid_sudoku(board)
  valid_rows_and_columns?(board) && valid_boxes?(board)
end

def valid_rows_and_columns?(board)
  (0...9).each do |y|
    column = []
    row = []
    (0...9).each do |x|
      row << board[y][x]
      column << board[x][y]
    end
    return false unless valid?(row) && valid?(column)
  end
  true
end

def valid?(row)
  hash = {}
  row.each do |cell|
    next if cell == '.'
    return false if hash.key? cell

    hash[cell] = true
  end

  true
end

def valid_boxes?(board)
  y_cap = 0
  until y_cap == 9
    x_cap = 0
    until x_cap == 9
      box = []
      (y_cap...(y_cap + 3)).each do |y|
        (x_cap...(x_cap + 3)).each do |x|
          box << board[y][x]
        end
        return false unless valid?(box)
      end
      x_cap += 3
    end
    y_cap += 3
  end

  true
end

# board = [[".",".",".",".","5",".",".","1","."],
#         [".","4",".","3",".",".",".",".","."],
#         [".",".",".",".",".","3",".",".","1"],
#         ["8",".",".",".",".",".",".","2","."],
#         [".",".","2",".","7",".",".",".","."],
#         [".","1","5",".",".",".",".",".","."],
#         [".",".",".",".",".","2",".",".","."],
#         [".","2",".","9",".",".",".",".","."],
#         [".",".","4",".",".",".",".",".","."]]
#
# board2 = [[".",".",".",".",".",".","5",".","."],
#           [".",".",".",".",".",".",".",".","."],
#           [".",".",".",".",".",".",".",".","."],
#           ["9","3",".",".","2",".","4",".","."],
#           [".",".","7",".",".",".","3",".","."],
#           [".",".",".",".",".",".",".",".","."],
#           [".",".",".","3","4",".",".",".","."],
#           [".",".",".",".",".","3",".",".","."],
#           [".",".",".",".",".","5","2",".","."]]
#
# puts is_valid_sudoku(board)
# puts is_valid_sudoku(board2)
