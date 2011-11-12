Dir["./nodes/*.rb", "./nodes/operations/*.rb"].each {|f| require f}

module Node
  include Operation
  extend self

  MAX_CONSTANT = 11
  DEBUG = false

  def node_methods
    method_modules.map(&:action)
  end

  def random_module
    method_modules[rand(method_modules.size)]
  end

  def random(data_size, max_depth=4, probability_of_an_operator_node=0.5, probability_of_a_parameter_node=0.6)
    random_number = rand
    if random_number < probability_of_an_operator_node && max_depth > 0
      choosen_module = random_module
      param_count = choosen_module.action_arity
      action = choosen_module.action
      sub_nodes = param_count.times.collect { random(data_size, max_depth - 1, probability_of_an_operator_node, probability_of_a_parameter_node) }
      Node::Operator.new(action, sub_nodes)
    elsif random_number < probability_of_a_parameter_node
      Node::Parameter.new(rand(data_size))
    else
      Node::Constant.new(rand(MAX_CONSTANT + 1))
    end
  end

  def log &block
    puts block.call if DEBUG
  end

end
