require "./node.rb"
# GeneticProgrammer.example_1([2,3])
class GeneticProgrammer

  def module_list
    @module_list ||= Node.method_modules
  end

  def choose_a_module
    module_list[rand(module_list.size)]
  end

  def make_random_tree(data_size, max_depth=4, function_node_probability=0.5, parameter_node_probability=0.6)
    random_number = rand
    if random_number < function_node_probability && max_depth > 0
      choosen_module = choose_a_module
      param_count = choosen_module.action_arity
      action = choosen_module.action
      sub_nodes = param_count.times.collect { make_random_tree(data_size, max_depth - 1, function_node_probability, parameter_node_probability) }
      Node::Operator.new(action, sub_nodes)
    elsif random_number < parameter_node_probability
      Node::Parameter.new(rand(data_size))
    else
      Node::Constant.new(rand(11))
    end
  end

  def example_1
    Node::Operator.new(:if_method,
         [
           Node::Operator.new(:greater_method,[Node::Parameter.new(0), Node::Constant.new(3)]),
           Node::Operator.new(:add_method,[Node::Parameter.new(1), Node::Constant.new(5)]),
           Node::Operator.new(:subtract_method,[Node::Parameter.new(1), Node::Constant.new(2)])
         ]
        )
  end

  def input_output_rows count=200
    count.times.map do
      x = rand(40)
      y = rand(40)
      [x,y,_function(x,y)]
    end
  end

  # move this to the node class!
  def mutate tree, data_size, probability_of_change=0.1
    if rand < probability_of_change
        puts "new..."
      make_random_tree data_size
    else
      modified_tree = tree.dup
      if modified_tree.respond_to?(:operands=)
        puts "mod..."
        modified_tree.operands = tree.operands.collect do |o_node|
          mutate(o_node, data_size, probability_of_change)
        end
      end
      modified_tree
    end
  end

  def score tree, data_rows
    data_rows.reduce(0) do |sum, data_row|
      Node.log { "data_row: #{data_row.inspect}" }
      result = tree.evaluate [data_row[0], data_row[1]]
      Node.log { "result (#{result}) vs. (#{data_row[2]}) actual" }
      sum += (result - data_row[2]).abs
    end
  end

  private

  def _function(x, y)
    x**2+2*y+3*x+5
  end

end
