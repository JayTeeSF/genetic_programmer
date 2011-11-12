require "./node.rb"
# GeneticProgrammer.example_1([2,3])
module GeneticProgrammer
  extend self
  INPUT_RANDOM_X = INPUT_RANDOM_Y = 40
  DEFAULT_DATASET_SIZE = 200

  def game_interface(node_tree)
    Node::Operator.new(:modulo, [node_tree, Node::Constant.new(4)])
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

  def input_output_rows count=DEFAULT_DATASET_SIZE
    count.times.map do
      x = rand(INPUT_RANDOM_X)
      y = rand(INPUT_RANDOM_Y)
      [[x,y],_function(x,y)]
    end
  end

  private

  def _function(x, y)
    x**2+2*y+3*x+5
  end

end
