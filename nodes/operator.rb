# require './operation.rb'
module Node
  class Operator < Base

    attr_reader :name, :operation, :operands
    def initialize(_operation, _operands=[], _name=nil)
      @operation = _operation
      @name = _name || "#{_operation}_#{Time.now.to_i}"
      @operands = _operands
    end

    def evaluate(data=[])
      Node.send operation, @operands.map {|operand_node| operand_node.evaluate(data) }
    end

    def display_variables
      [:@name]
    end

    def display(indent=0)
      super
      operands.each {|operand_node| operand_node.display(indent+1) }
    end
  end
end
