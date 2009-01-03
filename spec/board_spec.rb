require File.dirname(__FILE__) + '/spec_helper.rb'

describe Board do
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