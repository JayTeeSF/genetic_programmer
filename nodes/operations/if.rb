module Node::Operation::If
  extend self

  def action_arity
    3
  end

  def action
    :if_method
  end

  def if_method data=[]
    Node.log { "if called w/ #{data.inspect}" }
    data[0] > 0 ? data[1] : data[2]
  end
end
