require File.dirname(__FILE__) + '/spec_helper.rb'

describe Section do
  context "filling in single digit if missing" do
    it "does nothing if count of empty cells is 0" do
      cells = mock("cells", :count_of_empty_cells => 0)
      section = Section.new(cells)
      section.fill_in_single_digit_if_missing!
    end
    it "does nothing if count is > 1" do
      cells = mock("cells", :count_of_empty_cells => 2)
      section = Section.new(cells)
      section.fill_in_single_digit_if_missing!
    end
    it "it sets cell if count is 1" do
      cells = mock("cells", :count_of_empty_cells => 1)
      section = Section.new(cells)
      cells.should_receive(:set_missing_digit!)
      section.fill_in_single_digit_if_missing!
    end
  end
  
  
  context "asking for completeness" do
    it "says complete if all cells are completed" do
      cells = [mock("cell", :completed? => true), mock("cell", :completed? => true)]
      section = Section.new(cells)
      section.completed?.should be_true
    end
    
    it "says not complete if not all cells are completed" do
      cells = Array.new(rand(8),mock("cell", :completed? => true))
      expected_count = cells.length
      cells << mock_cell = mock("cell", :completed? => false)
      section = Section.new(cells)
      section.completed?.should be_false
    end
  end
end