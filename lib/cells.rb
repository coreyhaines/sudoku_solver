class Cells
  def initialize(cells)
    @cells= cells
  end
  def count_of_empty_cells
    @cells.find_all{|cell| ! cell.completed?}.length
  end
  def set_missing_digit!
    total_of_cells = @cells.inject(0) { |sum, cell| sum + cell.value}
    @cells.find{|cell| ! cell.completed?}.value = 45 - total_of_cells
  end
end