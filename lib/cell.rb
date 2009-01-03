class Cell
  def initialize(board, coordinates)
    @board = board
    @coordinates = coordinates
  end
  def completed?
    ! @board.empty?(@coordinates)
  end
  def value=(new_value)
    @board.set_value(@coordinates, new_value)
  end
  def value
    @board.get_value(@coordinates)
  end
end