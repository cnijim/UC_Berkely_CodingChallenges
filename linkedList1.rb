class Stack
  attr_reader :data

  def initialize
      @data = nil
  end

  def define(linkedList)
    @data = linkedList
  end

  # Push a value onto the stack
  def push(value)
    if @data
      @data = LinkedListNode.new(value, @data)
    else
      @data = LinkedListNode.new(value)
    end
    return @data
  end

  def pop
    if @data.nil?
      popValue="nil"
    else
      popValue = @data.value
      @data = @data.next_node      
    end
    return popValue
  end
end

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end



def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  reverseStack = Stack.new
  stack = Stack.new
  stack.define(list)

  while list
    poppedValue = stack.pop()
    # puts poppedValue
    if poppedValue != "nil"
      revlist = reverseStack.push(poppedValue)
    else
      return revlist
    end
  end
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)
