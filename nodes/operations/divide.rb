module Node::Operation::Divide
  extend self

  def action_arity
    2
  end

  def action
    :divide_method
  end

  def divide_method data=[]
    Node.log { "divide called w/ #{data.inspect}" }
    return nil if 0 == data[1]
    Float(data[0]) / data[1]
  end
end
