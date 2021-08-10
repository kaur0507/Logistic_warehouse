# class Graph

#   DISTANCE = [[0, 0, 0, 0, 0, 258, 0, 0, 0, 0, 0, 0, 220, 272, 361, 0], 
#             [0, 0, 80, 0, 0, 0, 0, 0, 161, 0, 205, 0, 0, 0, 0, 0], 
#             [0, 80, 0, 0, 111, 0, 0, 0, 161, 0, 205, 0, 0, 0, 0, 0], 
#             [0, 0, 0, 0, 0, 232, 239, 211, 0, 0, 0, 0, 0, 0, 181, 0], 
#             [0, 0, 111, 0, 0, 0, 0, 0, 0, 0, 208, 0, 0, 285, 0, 98], 
#             [258, 0, 0, 232, 0, 0, 0, 305, 0, 0, 224, 0, 0, 139, 167, 0],
#             [0, 0, 0, 239, 0, 0, 0, 199, 0, 325, 0, 0, 0, 0, 0, 0], 
#             [0, 0, 0, 211, 0, 305, 199, 0, 176, 172, 139, 0, 0, 0, 0, 0], 
#             [0, 121, 161, 0, 0, 0, 0, 176, 0, 189, 151, 158, 0, 0, 0, 0], 
#             [0, 0, 0, 0, 0, 0, 325, 172, 189, 0, 0, 164, 0, 0, 0, 0], 
#             [0, 266, 205, 0, 208, 224, 0, 139, 151, 0, 0, 0, 0, 202, 0, 0], 
#             [0, 169, 0, 0, 0, 0, 0, 0, 158, 164, 0, 0, 0, 0, 0, 0], 
#             [220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, 0, 188], 
#             [272, 0, 0, 0, 285, 139, 0, 0, 0, 0, 202, 0, 154, 0, 0, 182], 
#             [361, 0, 0, 181, 0, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
#             [0, 0, 0, 0, 98, 0, 0, 0, 0, 0, 0, 0, 188, 182, 0, 0]]

#   def hamilotnian_cycle_path(initial_value)

#     graph = DISTANCE
#     number_of_vertices = graph.length
#     visited_vertices = Array.new(number_of_vertices, false)
#     stack_of_vertices = []

#     stack_of_vertices.push(initial_value)

#     if stack_of_vertices.length < number_of_vertices
#       visited_vertices[initial_value] = true
#       i = 0
#       graph[initial_value].each do |distance| 
#         distance > 0 ? 
#       end
#     else

#     end

#     graph[initial_value].each do |distance|
#       visited_vertices[] = false
#     end

#     is_hamiltonian_cycle = false

#     graph[initial_value].each do |distance|

#     end

#   end

# end

class AjlistNode
  # Define the accessor and reader of class AjlistNode
  attr_reader :id, :next
  attr_accessor :id, :next 
  # Vertices node key
  def initialize(value) 
    # Set value of node key
    @id = value
    @next = nil
  end
end

class Vertices
  # Define the accessor and reader of class Vertices
  attr_reader :data, :next
  attr_accessor :data, :next 

  def initialize(value) 
    @data = value
    @next = nil
  end
end

class MyStack
  # Define the accessor and reader of class MyStack
  attr_reader :element, :next
  attr_accessor :element, :next 

  def initialize(element, top) 
    self.element = element
    self.next = top
  end
end

class MyGraph
  # Define the accessor and reader of class MyGraph
  attr_reader :size, :node, :top
  attr_accessor :size, :node, :top 
  # number of Vertices
  def initialize(size) 
    # set value
    self.size = size
    self.top = nil
    @node = Array.new(size) {nil}
    self.set_data()
  end
  # Set initial node value
  def set_data() 
    if (@node == nil) 
      print("\nEmpty Graph")
    else 
      index = 0
      while (index < @size) 
        @node[index] = Vertices.new(index)
        index += 1
      end
    end
  end
  # Connect two nodes
  def connect(start, last) 
    new_edge = AjlistNode.new(last)
    if (@node[start].next == nil) 
      @node[start].next = new_edge
    else 
      temp = @node[start].next
      while (temp.next != nil) 
        temp = temp.next
      end
      temp.next = new_edge
    end
  end
  # Add edge of two nodes
  def add_edge(start, last) 
    if (start >= 0 &&
      start < @size &&
      last >= 0 &&
      last < @size &&
      @node != nil) 
      self.connect(start, last)
      if (start != last) 
        self.connect(last, start)
      end
    else 
      print("\nHere Something Wrong")
    end
  end
  def push(element) 
    new_node = MyStack.new(element, @top)
    @top = new_node
  end
  def pop() 
    if (@top != nil) 
      @top = @top.next
    end
  end
  # Display Path from source to destination
  def print_path(temp) 
    if (temp == nil) 
      return
    end
    self.print_path(temp.next)
    print(" ", temp.element ," ")
  end
  def show_cycle(start, last, visit, n, length) 
    if (start > @size ||
      last > @size ||
      start < 0 ||
      last < 0 ||
      @node == nil) 
      return
    end
    if (start == last &&
      n == length) 
      self.push(start)
      print("\n (")
      self.print_path(@top)
      print(")")
      self.pop()
    end
    if (visit[start] == true)
      # base case
      return
    else 
      self.push(start)
    end
    visit[start] = true
    temp = @node[start].next
    while (temp != nil) 
      self.show_cycle(temp.id, last, visit, n, length + 1)
      temp = temp.next
    end
    self.pop()
    # reset the  value of visited node
    visit[start] = false
  end
  def print_graph() 
    if (@size > 0 &&
      @node != nil) 
      index = 0
      pom = []
      while (index < @size) 
        print("\n Adjacency list of vertex ", index ,":")
        temp = @node[index].next
        while (temp != nil) 
          pom = pom + @node
          print(" ", @node[temp.id].data)
          temp = temp.next
        end
        index += 1
      end
    end
  end
  def find_cycle(n) 
    if (@node == nil) 
      print("Graph is Empty\n")
    else 
      visit = Array.new(@size) {false}
      i = 0
      while (i < @size) 
        visit[i] = false
        i += 1
      end
      i = 0
      while (i < @size) 
        self.show_cycle(i, i, visit, n, 0)
        i += 1
      end
      print("\n")
    end
  end
end


totalNode = 6
g = MyGraph.new(totalNode)
g.add_edge(0, 1)
g.add_edge(0, 2)
g.add_edge(0, 5)
g.add_edge(1, 2)
g.add_edge(1, 3)
g.add_edge(2, 3)
g.add_edge(2, 4)
g.add_edge(2, 5)
g.add_edge(3, 4)
g.add_edge(4, 5)
g.print_graph()
cycle_length = 6
print("\n Cycles of length : ", cycle_length ," \n")
g.find_cycle(cycle_length)