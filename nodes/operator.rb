# require './operation.rb'
module Node
  class Operator < Base

    attr_reader :name, :operation
    attr_accessor :operands
    def initialize(_operation, _operands=nil, _name=nil)
      @operation = _operation
      @name = _name || "#{_operation}_#{Time.now.to_i}"
      @operands = _operands || []
    end

    def deep_copy
      dup.tap do |modified_node|
        unless operands.empty?
          modified_node.operands = operands.collect do |o_node|
            o_node.deep_copy
          end
        end
      end
    end

    def deep_mutate(data_size, probability_of_change)
      dup.tap do |modified_node|
        unless operands.empty?
          modified_node.operands = operands.collect do |o_node|
            o_node.mutate(data_size, probability_of_change)
          end
        end
      end
    end

    def evaluate(data=[])
      Node.send operation, @operands.map {|operand_node| operand_node.evaluate(data) }
    end

    def display_variables
      [:@name]
    end

    def raw
      super << operands.collect {|operand_node| operand_node.raw }
    end

    def display(indent=0)
      super
      operands.each {|operand_node| operand_node.display(indent+1) }
    end
  end
end
