require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  #Kahn's Algorithm
    #queue keeps the nodes that have not been sorted yet
    #whatever is popped off the stack goes to sorted and is done
    queue = []
    sorted = []

    #loop through vertices
    vertices.each do |vertex|
      #find vertices with no dependencies and push to queue
      queue << vertex if vertex.in_edges.empty?
    end

    #pop off from queue and check the out edges of each
    #after pop, delete the vertex all its out edges
    #push that vertex into the sorted array
    #look at each of the destination nodes and push them onto queue if no in edges
    #do this until the queue is empty
    until queue.empty?
      curr_node = queue.shift
      p curr_node.value

      sorted << curr_node
      to_vertices = []

      #grabs all the vertices connected to the out edges of the curr_node
      curr_node.out_edges.reverse.each do |out_edge|
      # until curr_node.out_edges.empty?


        # p out_edge.to_vertex.value
        to_vertices << out_edge.to_vertex

        #destroy the edge after using it up
        #destroy not working like how I thought it would, maybe save destroy for after

        # out_edge.destroy!
        out_edge.destroy!
      end

      #need to check if these vertices are connected to anything after
      #curr_node's out edge deletion
      to_vertices.each do |vertex|
        queue << vertex if vertex.in_edges.empty?
      end

      #check all vertices connected by curr_node's out_edges
      #if those
    end

    if sorted.length == vertices.length
      return sorted
    else
      return []
    end
    # easy_read = []
    # sorted.each do |vertex|
    #   easy_read << vertex.value
    # end
    # p easy_read



  #Tarjan's Algorithm
end
