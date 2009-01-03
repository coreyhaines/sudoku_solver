require File.dirname(__FILE__) + '/spec_helper.rb'

describe Board do
  context "asking for completeness" do
    it "says complete if all rows are completed" do
      Row.stub!(:new).and_return(mock("row", :completed? => true))
      board = Board.new
      board.completed?.should be_true
    end
  end
end