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
        @board.should_receive(:fill_in_columns_with_single_missing_digit!)
        @solver.complete(@board)
      end
      it "fills in squares" do
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
        @board.should_receive(:fill_in_columns_with_single_missing_digit!).exactly(@expected_times).times
        @solver.complete(@board)
      end
      it "fills in squares" do
        @board.should_receive(:fill_in_squares_with_single_missing_digit!).exactly(@expected_times).times
        @solver.complete(@board)
      end
    end
  end

end



describe SudokuSolver, "Complete Puzzle Specs" do

  context "Solving whole boards" do
    
    it "solved the wikipedia puzzle" do
      pending do
        board = [
                  [5,3,nil,nil,7,nil,nil,nil,nil],
                  [6,nil,nil,1,9,5,nil,nil,nil],
                  [nil,9,8,nil,nil,nil,nil,6,nil],
                  [8,nil,nil,nil,6,nil,nil,nil,3],
                  [4,nil,nil,8,nil,3,nil,nil,1],
                  [7,nil,nil,nil,2,nil,nil,nil,6],
                  [nil,6,nil,nil,nil,nil,2,8,nil],
                  [nil,nil,nil,4,1,9,nil,nil,5],
                  [nil,nil,nil,nil,8,nil,nil,7,9]
                ]
        solver = SudokuSolver.new
        solved = solver.solve(board)
    
        solved.flatten.join('').should == 
                "534678912672195348198342567" +
                "859761423426853791713924856" +
                "961537284287419635345286179"
      end
    end
  
    it "solves the Medium Puzzle" do
      pending do
      board = [
                [nil,4,nil,nil,nil,7,nil,3,nil],
                [nil,nil,8,5,nil,nil,1,nil,nil],
                [nil,1,5,nil,3,nil,nil,9,nil],
                [5,nil,nil,nil,7,nil,2,1,nil],
                [nil,nil,6,nil,nil,nil,8,nil,nil],
                [nil,8,1,nil,6,nil,nil,nil,9],
                [nil,2,nil,nil,4,nil,5,7,nil],
                [nil,nil,7,nil,nil,2,9,nil,nil],
                [nil,5,nil,7,nil,nil,nil,8,nil]
              ]

      solver = SudokuSolver.new
      solved = solver.solve(board)

      solved.flatten.join('').should == 
              "942187635368594127715236498" +
              "593478216476921853281365749" +
              "829643571137852964654719382"
      end
    end

  end
end
