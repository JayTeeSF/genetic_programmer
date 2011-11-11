module Node
  class Base
    def evaluate(data=[])
      raise NotImplementedError, "Method evaluate() must be implemented by subclasses of Node::Abstract"
    end

    def instance_values
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
  end
end
