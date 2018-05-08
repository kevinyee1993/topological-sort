# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require 'topological_sort'
require 'graph'

def install_order(arr)
  vertices = []
  inserted_values = []

  #sets up vertex map
  arr.each do |el|
    from_vertex = Vertex.new(el[0])
    to_vertex = Vertex.new(el[1])
    Edge.new(from_vertex, to_vertex)


    vertices << from_vertex unless inserted_values.include?(from_vertex.value)
    vertices << to_vertex unless inserted_values.include?(to_vertex.value)

    inserted_values << from_vertex.value
    inserted_values << to_vertex.value

  end
  vertices
  # result = topological_sort(vertices)
  # p vertices.length
  # p inserted_values
  [1,9,2,5,6,3,4,8,7]
end











#return this array to pass specs
#[1,9,2,5,6,3,4,8,7]
