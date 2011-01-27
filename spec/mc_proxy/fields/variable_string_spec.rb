require 'spec_helper'
require 'mc_proxy/fields/variable_string'

module McProxy::Fields
  describe VariableString, ".parse(data)" do
  
    it "should parse the correct number of characters" do
      data = "\x00\btazorionsieninaods"
      
      str = VariableString.parse(data)
      
      str.should == 'tazorion'
      str.should have(8).characters
    end
  
  end
  
  describe VariableString, ".parse(data, 10)" do
  
    it "should parse the correct number of characters" do
      data = "nnekdlsieb\x00\btazorionsieninaods"
      
      str = VariableString.parse(data, 10)
      
      str.should == 'tazorion'
      str.should have(8).characters
    end
  
  end  
end