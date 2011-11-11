module Node::Operation::Greater
  extend self

  def action_arity
    2
  end

  def action
    :greater_method
  end

  def greater_method data=[]
    Node.log { "greater called w/ #{data.inspect}" }
    data[0] > data[1] ? 1 : 0
  end
end
