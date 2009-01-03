require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Complete Puzzle Specs" do

  context "single digit row missing boards" do
    it "solves if only one missing digit" do
      starting_board = COMPLETE_BOARD.deep_clone
    
      starting_board[rand(9)][rand(9)] = nil
    
      solver = SudokuSolver.new
      solved_board = solver.complete(Board.parse(starting_board))
      solved_board.encoded.should == COMPLETE_BOARD.flatten.join("")
    end
    
    it "solves if two missing digits" do
      starting_board = COMPLETE_BOARD.deep_clone
    
      starting_board[4][8] = nil
      starting_board[1][3] = nil
    
      solver = SudokuSolver.new
      solved_board = solver.complete(Board.parse(starting_board))
      solved_board.encoded.should == COMPLETE_BOARD.flatten.join("")
    end

    it "solves if three missing digits" do
      starting_board = COMPLETE_BOARD.deep_clone
    
      starting_board[4][8] = nil
      starting_board[1][3] = nil
      starting_board[8][1] = nil
    
      solver = SudokuSolver.new
      solved_board = solver.complete(Board.parse(starting_board))
      solved_board.encoded.should == COMPLETE_BOARD.flatten.join("")
    end

  end



  context "Solving whole boards" do
    
    it "solved the wikipedia puzzle" do
      pending do
        board = Board.parse(
                [
                  [5,3,nil,nil,7,nil,nil,nil,nil],
                  [6,nil,nil,1,9,5,nil,nil,nil],
                  [nil,9,8,nil,nil,nil,nil,6,nil],
                  [8,nil,nil,nil,6,nil,nil,nil,3],
                  [4,nil,nil,8,nil,3,nil,nil,1],
                  [7,nil,nil,nil,2,nil,nil,nil,6],
                  [nil,6,nil,nil,nil,nil,2,8,nil],
                  [nil,nil,nil,4,1,9,nil,nil,5],
                  [nil,nil,nil,nil,8,nil,nil,7,9]
                ])
        solver = SudokuSolver.new
        solved = solver.solve(board)
    
        solved.encoded.should == 
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
