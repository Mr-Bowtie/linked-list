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
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    tail.next_node = new_node if tail
    self.head = new_node unless head
    self.tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = head
    self.head = new_node
    self.tail = new_node unless tail
  end
end

new_list = LinkedList.new
new_list.prepend(3)
new_list.prepend(2)
new_list.prepend(1)
p new_list
