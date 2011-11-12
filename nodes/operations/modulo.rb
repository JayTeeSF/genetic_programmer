module Node::Operation::Modulo
  extend self

  def action_arity
    2
  end

  def action
    :modulo_method
  end

  def modulo_method data=[]
    Node.log { "modulo called w/ #{data.inspect}" }
    return 0 if 0 == data[1]
    data[0] % data[1]
  end
end
