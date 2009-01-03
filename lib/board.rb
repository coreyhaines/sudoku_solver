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

  def get_value(coordinate)
    @board[coordinate.row][coordinate.column]
  end
  def set_value(coordinate, new_value)
    @board[coordinate.row][coordinate.column] = new_value
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
    (0..8).map do |row_index|
      cells = (0..8).map do |column_index|
        Cell.new(self, Coordinate.new(row_index,column_index))
      end
      Section.new(Cells.new(cells))
    end
  end
  def columns
    (0..8).map do |column_index|
      cells = (0..8).map do |row_index|
        Cell.new(self, Coordinate.new(row_index,column_index))
      end
      Section.new(Cells.new(cells))
    end
  end
  def squares
    squares = []

    cells = []
    0.upto(2) do |row_index|
      0.upto(2) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))

    cells = []
    3.upto(5) do |row_index|
      0.upto(2) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))

    cells = []
    6.upto(8) do |row_index|
      0.upto(2) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))


    cells = []
    0.upto(2) do |row_index|
      3.upto(5) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))

    cells = []
    3.upto(5) do |row_index|
      3.upto(5) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))

    cells = []
    6.upto(8) do |row_index|
      3.upto(5) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))


    cells = []
    0.upto(2) do |row_index|
      6.upto(8) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))

    cells = []
    3.upto(5) do |row_index|
      6.upto(8) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))

    cells = []
    6.upto(8) do |row_index|
      6.upto(8) do |column_index|
        cells << Cell.new(self, Coordinate.new(row_index, column_index))
      end
    end
    squares << Section.new(Cells.new(cells))




    squares
  end
end
