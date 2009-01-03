class Row
  def completed?
    cells.all? { |cell| cell.completed? }
  end
end
