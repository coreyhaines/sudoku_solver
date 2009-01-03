class Cell
  def initialize(board, coordinates)
    @board = board
    @coordinates = coordinates
  end
  def completed?
    ! @board.empty?(@coordinates)
  end
end