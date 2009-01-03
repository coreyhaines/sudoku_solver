require File.dirname(__FILE__) + '/spec_helper.rb'

describe Cells do
  context "asking for count of empty cells" do
    it "return the number of empty cells" do
      count_of_empty_cells = rand(9)
      empty = Array.new(count_of_empty_cells, mock("cell", :completed? => false))
      filled = Array.new(9-count_of_empty_cells, mock("cell", :completed? => true))
      cells = Cells.new(empty + filled)
      cells.count_of_empty_cells.should == count_of_empty_cells
    end
  end
  context "setting missing digit" do
    it "set the missing cell to the digit that isn't there" do
      filled = Array.new(8) {|index| mock("cell", :value => index+1, :completed? => true)}
      empty = [mock("cell", :value => 0, :completed? => false)]
      cells = Cells.new(empty + filled)
      empty[0].should_receive(:value=).with(9)
      cells.set_missing_digit!
    end
  end
end