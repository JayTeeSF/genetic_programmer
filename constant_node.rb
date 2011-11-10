class ConstantNode

  attr_reader :value
  def initialize(_value)
    @value = _value
  end

  def evaluate(data=[])
    @value
  end
end
