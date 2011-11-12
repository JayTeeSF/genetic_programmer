module Node::Operation::Multiply
  extend self

  def action_arity
    2
  end

  def action
    :multiply_method
  end

  def multiply_method data=[]
    Node.log { "multiply called w/ #{data.inspect}" }
    data[0] * data[1]
  end
end
