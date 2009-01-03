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
end
