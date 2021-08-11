#!/usr/bin/env ruby

require './packages.rb'
require './graph.rb'
require './vehicles.rb'
require './lorry.rb'
require './truck.rb'
require './train.rb'
require './warehouse.rb'

def packages_array_creation(amount_of_packages, amount_of_magazines)

  packages_located_by_destination = Array.new(amount_of_magazines){Array.new(0)}

  for i in (0...amount_of_packages) do
    package = Package.new
    packages_located_by_destination[package.destination].push(package)
  end
  packages_located_by_destination
end

def the_best_path(amount_of_magazines)

  g = MyGraph.new(amount_of_magazines)
  g.add_edge(0, 5)
  g.add_edge(0, 12)
  g.add_edge(0, 13)
  g.add_edge(0, 14)
  g.add_edge(1, 2)
  g.add_edge(1, 8)
  g.add_edge(1, 10)
  g.add_edge(1, 11)
  g.add_edge(2, 4)
  g.add_edge(2, 8)
  g.add_edge(2, 10)
  g.add_edge(3, 5)
  g.add_edge(3, 6)
  g.add_edge(3, 7)
  g.add_edge(3, 14)
  g.add_edge(4, 10)
  g.add_edge(4, 13)
  g.add_edge(4, 15)
  g.add_edge(5, 7)
  g.add_edge(5, 10)
  g.add_edge(5, 13)
  g.add_edge(5, 14)
  g.add_edge(6, 7)
  g.add_edge(6, 9)
  g.add_edge(7, 8)
  g.add_edge(7, 9)
  g.add_edge(7, 10)
  g.add_edge(8, 9)
  g.add_edge(8, 10)
  g.add_edge(8, 11)
  g.add_edge(9, 11)
  g.add_edge(10, 13)
  g.add_edge(12, 13)
  g.add_edge(12, 15)
  g.add_edge(13, 15)
  g.find_cycle(amount_of_magazines)

  $optimal_path.pop()
  magazine_number = rand(0...amount_of_magazines)
  index_of_the_magazine_location = $optimal_path.index(magazine_number)
  $optimal_path = $optimal_path.rotate(index_of_the_magazine_location)
  $optimal_path.push($optimal_path[0])
  return $optimal_distance, $optimal_path
end

amount_of_magazines = 16 # equal to amount of vertices
amount_of_packages = 10000

array = packages_array_creation(amount_of_packages, amount_of_magazines)

# array.each do |packages| 
#   for i in (0...packages.length) 
#     puts packages[i].value
#   end
# end

def the_best_path(amount_of_magazines)

  g = MyGraph.new(amount_of_magazines)
  g.add_edge(0, 5)
  g.add_edge(0, 12)
  g.add_edge(0, 13)
  g.add_edge(0, 14)
  g.add_edge(1, 2)
  g.add_edge(1, 8)
  g.add_edge(1, 10)
  g.add_edge(1, 11)
  g.add_edge(2, 4)
  g.add_edge(2, 8)
  g.add_edge(2, 10)
  g.add_edge(3, 5)
  g.add_edge(3, 6)
  g.add_edge(3, 7)
  g.add_edge(3, 14)
  g.add_edge(4, 10)
  g.add_edge(4, 13)
  g.add_edge(4, 15)
  g.add_edge(5, 7)
  g.add_edge(5, 10)
  g.add_edge(5, 13)
  g.add_edge(5, 14)
  g.add_edge(6, 7)
  g.add_edge(6, 9)
  g.add_edge(7, 8)
  g.add_edge(7, 9)
  g.add_edge(7, 10)
  g.add_edge(8, 9)
  g.add_edge(8, 10)
  g.add_edge(8, 11)
  g.add_edge(9, 11)
  g.add_edge(10, 13)
  g.add_edge(12, 13)
  g.add_edge(12, 15)
  g.add_edge(13, 15)
  g.find_cycle(amount_of_magazines)

  $optimal_path.pop()
  magazine_number = rand(0...amount_of_magazines) # number of start magazine
  index_of_the_magazine_location = $optimal_path.index(magazine_number)
  $optimal_path = $optimal_path.rotate(index_of_the_magazine_location)
  $optimal_path.push($optimal_path[0])
  return $optimal_distance, $optimal_path
end

result_of_optimum_searching = the_best_path(amount_of_magazines)
p only_distance = result_of_optimum_searching[0]
p only_path = result_of_optimum_searching[1]