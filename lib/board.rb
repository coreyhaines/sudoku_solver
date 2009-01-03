class Board
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
  def fill_in_single_digits_if_missing collection
    collection.each { |column| column.fill_in_single_digit_if_missing!}
  end
end
