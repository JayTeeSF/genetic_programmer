module Node::Operation::Subtract
  extend self

  def action_arity
    2
  end

  def action
    :subtract_method
  end

  def subtract_method data=[]
    Node.log { "subtract called w/ #{data.inspect}" }
    data[0] - data[1]
  end
end
