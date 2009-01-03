$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'board'

class SudokuSolver
  VERSION = '0.0.1'
  
  
  def complete(board)
    until board.completed?
      board.fill_in_rows_with_single_missing_digit!
      board.fill_in_columns_with_single_missing_digit!
      # board.fill_in_squares_with_single_missing_digit!
      # board.fill_in_pairs_in_rows!
      # board.fill_in_pairs_in_columns!
      # board.fill_in_pairs_in_squares!
      # board.fill_in_triplets_in_rows!
      # board.fill_in_triplets_in_columns!
      # board.fill_in_triplets_in_squares!
      # ...
    end
    #board.brute_force_finish! unless board.completed?
    board
  end
  
end