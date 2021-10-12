require_relative "node"
class LinkedList

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    data = Node.new(value)
    if @head.nil?
      @head = data
      @tail = data
    else
      @tail.next = data
      @tail = data
    end
  end

  def prepend(value)
    data = Node.new(value)
    if @head.nil?
      @head = data
      @tail = data
    else
      data.next = @head
      @head = data
    end
  end

  def size
    node = @head
    i = 0
    until node.nil?
      node = node.next
      i += 1
    end
    return i
  end

  def at(index)
    if index == 0
      return @head
    elsif index < 0
      return nil
    else
      i = 0
      node = @head
      while i != index 
        node = node.next
        i += 1
      end
      return node
    end
  end

  def pop
    if @head.nil?
      nil
    else
     node = @head
     until node.next.next.nil?
       node = node.next
     end
     result = node.next
     @tail = node
     node.next = nil
     return result 
    end
  end

  def contains?(value)
    node = @head
    while !node.nil?
      if node.value == value
        return true
      end
      node = node.next
    end
    false
  end

  def find(value)
    return if @head.nil?
    node = @head
    i = 0 
    while !node.nil?
      if node.value == value
        return i
      end
      i += 1
      node = node.next
    end
  end

  def to_s
    return nil if @head.nil?
    node = @head
    until node.nil?
      print "(#{node.value}) -> "
      node = node.next
  end
    print "nil"
  end

  def insert_at(index, value)
    return puts 'Error: selected index is outside of the given range.' if index > self.size
    if index == 0
      prepend(value) 
    else
      new_node = Node.new(value)
      previous_node = self.at(index - 1)
      new_node.next = self.at(index)
      previous_node.next = new_node
    end
  end

  def remove(index)
    return puts 'Error: selected index is outside of the given range.' if index > self.size
    if index == 0
      @head = self.at(1)
    elsif self.at(index) == @tail
      @tail = self.at(index - 1)
      @tail.next = nil
    else
      previous_node = self.at(index - 1)
      previous_node.next = self.at(index + 1)
  end
  end
end

list = LinkedList.new
list.append("first node")
list.append("second node")
list.append("third node")
list.append("tail")
list.prepend("head")
puts "Size: #{list.size}"
puts "find method #{list.find("third node")}"
puts "I'm head -> #{list.head}"
puts "I'm tail -> #{list.tail}"
puts "Node with index 3 is #{list.at(3)}"
puts "Poped value is -> #{list.pop}"
puts list.contains?("third node")
list.insert_at(2, "inserted node")
puts list.to_s
list.remove(1)
puts list.to_s
