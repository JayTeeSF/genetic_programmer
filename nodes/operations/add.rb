module Node::Operation::Add
  extend self

  def action_arity
    2
  end

  def action
    :add_method
  end

  def add_method data=[]
    Node.log { "add called w/ #{data.inspect}" }
    data[0] + data[1]
  end
end
