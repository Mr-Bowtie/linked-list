class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :size, :head, :tail

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    tail.next_node = new_node if tail
    self.head = new_node unless head
    self.tail = new_node
  end
end

new_list = LinkedList.new
p new_list
new_list.append(3)
p new_list
