module Node
  class Constant < Base
    attr_reader :value
    def initialize(_value)
      @value = _value
    end

    def evaluate(data=[])
      @value
    end
  end
end
