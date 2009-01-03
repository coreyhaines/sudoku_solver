class Board
  def completed?
    rows.all? {|row|row.completed?}
  end
end
