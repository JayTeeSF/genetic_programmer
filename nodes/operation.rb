module Node::Operation
  extend self
  def self.included(base)
    method_modules = [ If, Greater, Add, Subtract, Multiply, Divide, Modulo ]
    method_modules.each { |mod| base.send(:include, mod) }
    base.send(:define_method, :method_modules) { method_modules }
  end
end
