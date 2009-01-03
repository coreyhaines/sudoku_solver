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
    val = @board.get_value(@coordinates)
    val.nil? ? 0 : val
  end
end