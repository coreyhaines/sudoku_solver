require File.dirname(__FILE__) + '/spec_helper.rb'

describe Cell do
  before(:each) do
    @board = mock("board")
    @coordinates = mock("coord")
    @cell = Cell.new @board, @coordinates
  end
  context "values" do
    it "tells the board to set the value" do
      val = rand(9)
      @board.should_receive(:set_value).with(@coordinates, val)
      @cell.value = val
    end
    it "asks the board for the value" do
      val = rand(9)
      @board.should_receive(:get_value).with(@coordinates).and_return(val)
      @cell.value.should == val
    end
  end
  context "asking for completion" do
    it "returns false if the board says it is empty" do
      @board.should_receive(:empty?).with(@coordinates).and_return true
      @cell.completed?.should be_false
    end
    it "returns true if the board says it is not empty" do
      @board.should_receive(:empty?).with(@coordinates).and_return false
      @cell.completed?.should be_true
    end
  end
end