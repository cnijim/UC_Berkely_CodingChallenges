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

@listNodeInstructions = []
def unpack_linked_list(list_node)
  if list_node
    @listNodeInstructions << list_node.value
    unpack_linked_list(list_node.next_node)
  else
    return @listNodeInstructions
  end
end

def construct_node(instructions)
  init = true
  instructions.each do |instruction|
    if init == true
      reversedNode = LinkedListNode.new(instruction)
      @nodeOfInterest = reversedNode
      init = false
    else
      reversedNode = LinkedListNode.new(instruction, @nodeOfInterest)
      @nodeOfInterest = reversedNode
    end
  end
  return @nodeOfInterest
end


def reverse_list(node)
  nodeInstructions = unpack_linked_list(node)
  finalNode = construct_node(nodeInstructions)
  return finalNode
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(revlist)
puts ""
