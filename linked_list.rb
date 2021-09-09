class Node
  def initialize(value = nil)
    attr_accessor :next_node, :value

    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end
end
