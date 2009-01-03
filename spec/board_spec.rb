require File.dirname(__FILE__) + '/spec_helper.rb'



describe Board do 
  
  context "parsing initial game array" do
    it "allow you get to ask for the number at a specific square" do
      board = Board.parse(COMPLETE_BOARD)
      
      COMPLETE_BOARD.each_with_index do |row, row_index|
        row.each_with_index do |cell_value, cell_index|
          board.value_at(row_index,cell_index).should == cell_value
        end
      end
    end
  end

  context "getting and setting values" do
    board = Board.parse(COMPLETE_BOARD)
    coordinates = Coordinate.new(3,3)
    before_value = board.get_value(coordinates)
    board.set_value(coordinates, before_value+1)
    board.get_value(coordinates).should == before_value+1
  end


  context "asking for whether a given spot is empty" do
    it "tells you a nil entry is empty" do
      COMPLETE_BOARD[1][1] = nil
      board = Board.parse(COMPLETE_BOARD)
      board.empty?(Coordinate.new(1,1)).should be_true
    end
    it "tells you a non-nil entry is not empty" do
      COMPLETE_BOARD[1][1] = nil
      board = Board.parse(COMPLETE_BOARD)
      board.empty?(Coordinate.new(2,1)).should be_false
    end
  end
  
  context "encoding game array" do
    it "gives a nice string representation" do
      board = Board.parse(COMPLETE_BOARD)
      board.encoded.should == COMPLETE_BOARD.flatten.join("")
    end
  end
  
  
  
  context "filling in rows with single digits missing" do
    it "tells each row to fill in single digit if missing" do
      rows = Array.new(3) { mock("row")}
      rows.each { |row| row.should_receive(:fill_in_single_digit_if_missing!)}
      board = Board.new
      board.stub!(:rows).and_return(rows)
      board.fill_in_rows_with_single_missing_digit!
    end
  end

  context "filling in columns with single digits missing" do
    it "tells each column to fill in single digit if missing" do
      columns = Array.new(3) { mock("column")}
      columns.each { |col| col.should_receive(:fill_in_single_digit_if_missing!)}
      board = Board.new
      board.stub!(:columns).and_return(columns)
      board.fill_in_columns_with_single_missing_digit!
    end
  end

  context "filling in squares with single digits missing" do
    it "tells each squareumn to fill in single digit if missing" do
      squares = Array.new(3) { mock("squares")}
      squares.each { |square| square.should_receive(:fill_in_single_digit_if_missing!)}
      board = Board.new
      board.stub!(:squares).and_return(squares)
      board.fill_in_squares_with_single_missing_digit!
    end
  end
  
  
  context "asking for completeness" do
    it "says complete if all rows are completed" do
      rows = [mock("row", :completed? => true), mock("row", :completed? => true)]
      board = Board.new
      board.stub!(:rows).and_return(rows)
      board.completed?.should be_true
    end
    
    it "says not complete if not all rows are completed" do
      rows = Array.new(rand(8),mock("row", :completed? => true))
      expected_count = rows.length
      rows << mock_row = mock("row", :completed? => false)
      board = Board.new
      board.stub!(:rows).and_return(rows)
      board.completed?.should be_false
    end
  end
  
  
  
end