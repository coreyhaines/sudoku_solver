class Coordinate
  attr_accessor :row, :column
  def initialize(row, column)
    self.row = row
    self.column = column
  end
end

class Board
  def self.parse(array)
    Board.new(array)
  end

  def initialize(array=Array.new(9){Array.new(9)})
    @board = array
  end
  def encoded
    @board.flatten.join("")
  end

  def empty?(coordinate)
    @board[coordinate.row][coordinate.column].nil?
  end

  def value_at(row_index, column_index)
    @board[row_index][column_index]
  end
  
  def completed?
    rows.all? {|row|row.completed?}
  end
  
  def fill_in_rows_with_single_missing_digit!
    fill_in_single_digits_if_missing rows
  end
  
  def fill_in_columns_with_single_missing_digit!
    fill_in_single_digits_if_missing columns
  end

  def fill_in_squares_with_single_missing_digit!
    fill_in_single_digits_if_missing squares
  end
  
private
  def fill_in_single_digits_if_missing sections
    sections.each { |section| section.fill_in_single_digit_if_missing!}
  end
  
  def rows
    rows_of_cells = []
    @board.each_with_index do |row_digits, row_index|
      cells_for_this_row = []
      row_digits.each_with_index do |digit, column_index|
        cells_for_this_row << Cell.new(self, Coordinate.new(row_index,column_index))
      end
      rows_of_cells << Section.new(Cells.new(cells_for_this_row))
    end
    rows_of_cells
  end
  
end
