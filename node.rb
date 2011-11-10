class Node

  attr_reader :name, :method, :children
  def initialize(_method, _children=[], _name=nil)
   @method = _method
   @name = _name || "#{_method}_#{Time.now.to_i}"
   @children = _children
  end

  # although methods already have arity
  # we may need to make our own wrapper
  # so that we can support the common interface
  # of passing an array of data
  def node_arity method_name
    case method_name
    when :if_method
      3
    when :greater_method
      2
    when :subtract_method
    when :add_method
      2
    when :subtract_method
      2
    else
      raise RuntimeError, "unknown method: #{method_name}"
    end
  end

  def greater_method data=[]
    puts "greater called w/ #{data.inspect}"
    data[0] > data[1]
  end

  def subtract_method data=[]
    puts "subtract called w/ #{data.inspect}"
    data[0] - data[1]
  end

  def add_method data=[]
    puts "add called w/ #{data.inspect}"
    data[0] + data[1]
  end

  def if_method data=[]
    puts "if called w/ #{data.inspect}"
    data[0] > 0 ? data[1] : data[2]
  end

  #
  # this seems to imply method is defined on self
  # wonder if there's a notation for initializing
  # a node with an object-method combination
  #
  def evaluate(data=[])
    send method, @children.map {|cn| cn.evaluate(data) }
  end
end
