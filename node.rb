Dir["./nodes/*.rb", "./nodes/operations/*.rb"].each {|f| require f}

module Node
  include Operation
  extend self

  DEBUG = false

  def node_methods
    method_modules.map(&:action)
  end

  def log &block
    puts block.call if DEBUG
  end

end
