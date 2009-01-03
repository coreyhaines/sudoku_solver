require File.dirname(__FILE__) + '/spec_helper.rb'

describe Cell do
  context "asking for completion" do
    it "returns false if the board says it is empty" do
      board = mock("board")
      coordinates = mock("coord")
      cell = Cell.new board, coordinates
      board.should_receive(:empty?).with(coordinates).and_return true
      cell.completed?.should be_false
    end
    it "returns true if the board says it is not empty" do
      board = mock("board")
      coordinates = mock("coord")
      cell = Cell.new board, coordinates
      board.should_receive(:empty?).with(coordinates).and_return false
      cell.completed?.should be_true
    end
  end
end