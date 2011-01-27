module McProxy
  
  class Parser
   
    def initialize(data, offset=0)
      @data = data
      @offset = 0
    end
    
    def parse(&block)
      block.call(self)
    end
    
    def short_field
      @data.bytes.to_a
    end
    
    
    
    class SignedShort < BitStruct
      signed :value, 16
    end
    
  end
end