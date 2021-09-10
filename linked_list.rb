class Node
  attr_accessor :data, :next_node

  def initialize(data = nil)
    @data = data
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

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    1.upto(index) do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    self.at(size - 2).next_node = nil
    @tail = self.at(size - 1)
  end

  def contains?(value)
    current_node = @head
    1.upto(size) do
      return true if current_node.data == value
      current_node = current_node.next_node
    end
    false
  end
end

new_list = LinkedList.new
new_list.prepend(3)
new_list.prepend(2)
new_list.prepend(1)
p new_list.contains?(3)
p new_list.contains?(5)
