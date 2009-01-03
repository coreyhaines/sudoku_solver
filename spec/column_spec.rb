require File.dirname(__FILE__) + '/spec_helper.rb'

describe Column do
  context "asking for completeness" do
    it "says complete if all cells are completed" do
      cells = [mock("cell", :completed? => true), mock("cell", :completed? => true)]
      column = Column.new
      column.stub!(:cells).and_return(cells)
      column.completed?.should be_true
    end
    
    it "says not complete if not all cells are completed" do
      cells = Array.new(rand(8),mock("cell", :completed? => true))
      expected_count = cells.length
      cells << mock_cell = mock("cell", :completed? => false)
      column = Column.new
      column.stub!(:cells).and_return(cells)
      column.completed?.should be_false
    end
  end
end