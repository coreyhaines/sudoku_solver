class Section
  def initialize(cells)
    self.cells = cells
  end
  
  def completed?
    cells.all? { |cell| cell.completed? }
  end
  
  def fill_in_single_digit_if_missing!
    if cells.count_of_empty_cells == 1
      cells.set_missing_digit!
    end
  end
  
private
  attr_accessor :cells
end
