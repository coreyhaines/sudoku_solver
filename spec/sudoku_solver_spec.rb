require File.dirname(__FILE__) + '/spec_helper.rb'



describe SudokuSolver do
  it "returns a completed board" do
    board = mock("board", :completed? => true, :encoding => COMPLETE_BOARD.flatten.join(''))
    solver = SudokuSolver.new
    completed_board = solver.complete(board)
    board.encoding.should == completed_board.encoding
  end

  context "unfinished board" do
    before(:each) do
      @board = mock("board", 
                :fill_in_rows_with_single_missing_digit! => nil,
                :fill_in_columns_with_single_missing_digit! => nil,
                :fill_in_squares_with_single_missing_digit! => nil)
      @solver = SudokuSolver.new
    end
    context "single digits missing" do
      before(:each) do
        @board.should_receive(:completed?).and_return(false, true)
      end
      it "fills in rows" do
        @board.should_receive(:fill_in_rows_with_single_missing_digit!)
        @solver.complete(@board)
      end
      it "fills in cols" do
        pending
        @board.should_receive(:fill_in_columns_with_single_missing_digit!)
        @solver.complete(@board)
      end
      it "fills in squares" do
        pending
        @board.should_receive(:fill_in_squares_with_single_missing_digit!)
        @solver.complete(@board)
      end
    end
    context "multiple single digits missing" do
      before(:each) do
        answers = Array.new(rand(20), false )
        @expected_times = answers.length
        answers << true
        @board.should_receive(:completed?).and_return(*answers)
      end
      it "fills in rows until completed" do
        @board.should_receive(:fill_in_rows_with_single_missing_digit!).exactly(@expected_times).times
        @solver.complete(@board)
      end
      it "fills in cols" do
        pending
        @board.should_receive(:fill_in_columns_with_single_missing_digit!).exactly(@expected_times).times
        @solver.complete(@board)
      end
      it "fills in squares" do
        pending
        @board.should_receive(:fill_in_squares_with_single_missing_digit!).exactly(@expected_times).times
        @solver.complete(@board)
      end
    end
  end

end


