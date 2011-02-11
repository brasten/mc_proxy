require 'spec_helper'
require 'mc_proxy/parser'

module McProxy

  describe Parser, "parsing packet" do
    before(:each) do
      data = "\x02\x00\btazorion\x00\asdfssef"

      @parser = Parser.new(data)
    end

    it "can parse a byte and variable string" do
      @parser.parse do |p|
        p.byte_field.should == 2
        p.text_field.should == "tazorion"
        p.short_field.should == 7
      end
    end
  end

end