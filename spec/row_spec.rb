require File.dirname(__FILE__) + '/spec_helper.rb'

describe Row do
  context "filling in single digit if missing" do
    it "does nothing if count of empty cells is 0" do
      cells = Array.new(9, mock("cell", :completed? => true))
      row = Row.new
      row.stub!(:cells).and_return(cells)
      row.fill_in_single_digit_if_missing!
    end
    it "does nothing if count is > 1" do
      cells = Array.new(7, mock("cell", :completed? => true))
      cells += Array.new(2, mock("cell", :completed? => false))
      row = Row.new
      row.stub!(:cells).and_return(cells)
      row.fill_in_single_digit_if_missing!
    end
    it "it sets cell if count is 1" do
      cells = Array.new(8, mock("cell", :completed? => true))
      cells += Array.new(1, mock("cell", :completed? => false))
      row = Row.new
      row.stub!(:cells).and_return(cells)
      cells.should_receive(:set_missing_digit!)
      row.fill_in_single_digit_if_missing!
    end
  end
  
  
  context "asking for completeness" do
    it "says complete if all cells are completed" do
      cells = [mock("cell", :completed? => true), mock("cell", :completed? => true)]
      row = Row.new
      row.stub!(:cells).and_return(cells)
      row.completed?.should be_true
    end
    
    it "says not complete if not all cells are completed" do
      cells = Array.new(rand(8),mock("cell", :completed? => true))
      expected_count = cells.length
      cells << mock_cell = mock("cell", :completed? => false)
      row = Row.new
      row.stub!(:cells).and_return(cells)
      row.completed?.should be_false
    end
  end
end