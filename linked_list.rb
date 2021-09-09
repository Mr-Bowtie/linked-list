class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @tail.next_node = new_node if @tail
    @head = new_node unless @head
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    @tail = new_node unless @tail
  end

  def size
    count = 0
    current_node = @head
    loop do
      break if current_node == nil
      count += 1
      current_node = current_node.next_node
    end
    count
  end
end

new_list = LinkedList.new
new_list.prepend(3)
new_list.prepend(2)
new_list.prepend(1)
p new_list.size
