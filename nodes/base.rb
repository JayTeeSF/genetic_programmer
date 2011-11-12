module Node
  class Base
    def evaluate(data=[])
      raise NotImplementedError, "Method evaluate() must be implemented by subclasses of Node::Abstract"
    end

    def instance_values
      instance_value_map.values
    end

    def ==(other)
      raw == other.raw
    end

    def raw
      instance_value_map.values
    end

    def display_variables
      instance_variables
    end

    def instance_value_map
      display_variables.reduce({}) {|m,v| m[v] = instance_variable_get(v); m}
    end

    def display(indent=0)
      printf "%s%s\n", "\t" * indent, instance_value_map.inspect
    end

    def crossover other, probability_of_swap=0.7, top=true
      if rand < probability_of_swap && !top
        other.deep_copy
      else
        deep_copy.tap do |result|
          if respond_to?(:operands) && other.respond_to?(:operands) && !operands.empty? && !other.operands.empty?
            result.operands = result.operands.collect do |operand_node|
              operand_node.crossover( other.operands[rand(other.operands.size)], probability_of_swap, false )
            end
          end
        end
      end
    end

    def mutate data_size, probability_of_change=0.1
      rand < probability_of_change ?  Node.random(data_size) : dup
    end

    def squared_difference data_rows
      data_rows.reduce(0) do |sum, data_row|
        Node.log { "data_row: #{data_row.inspect}" }
        result = evaluate data_row[0]
        Node.log { "result (#{result}) vs. (#{data_row[1]}) actual" }
        sum += (result - data_row[1]).abs
      end
    end

    alias :deep_copy :dup
  end
end
