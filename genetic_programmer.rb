# Dir["./*.rb"].each {|f| require f}
# GeneticProgrammer.example_1([2,3])
module GeneticProgrammer
  extend self

  def example_1
    Node.new(:if_method,
         [
           Node.new(:greater_method,[ParameterNode.new(0), ConstantNode.new(3)]),
           Node.new(:add_method,[ParameterNode.new(1), ConstantNode.new(5)]),
           Node.new(:subtract_method,[ParameterNode.new(1), ConstantNode.new(2)])
         ]
        )
  end
end
