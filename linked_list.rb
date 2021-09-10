require 'pry'

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

  def find(value)
    0.upto(size - 1) { |i| return i if self.at(i).data == value }
    nil
  end

  def to_s
    output = ''
    0.upto(size - 1) do |i|
      output += "( #{self.at(i).data} ) -> "
    end
    output += 'nil'
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    back_node = at(index)

    @head = new_node if at(index) == head()
    @tail = new_node if at(index) == tail()

    unless index == 0
      front_node = at(index - 1)
      front_node.next_node = new_node
    end
    new_node.next_node = back_node
  end

  def remove_at(index)
    return nil if index > size - 1
    trash_node = at(index)
    front_node = at(index - 1) unless index == 0
    back_node = at(index + 1) unless index == size - 1
    case index
    when 0
      @head = back_node
    when size - 1
      front_node.next_node = nil
      @tail = front_node
    else
      front_node.next_node = back_node
    end
    trash_node.next_node = nil
  end
end

new_list = LinkedList.new
new_list.prepend(2)
new_list.append(3)
new_list.prepend(1)
new_list.insert_at(5, 1)
new_list.insert_at(2, 0)
p new_list.to_s
new_list.remove_at(5)
p new_list.to_s
new_list.remove_at(0)
p new_list.to_s
new_list.remove_at(3)
p new_list.to_s
