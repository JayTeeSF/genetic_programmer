class ParameterNode

  attr_reader :index
  def initialize(_index)
    @index = _index
  end

  def evaluate(data=[])
    data[@index]
  end
end
