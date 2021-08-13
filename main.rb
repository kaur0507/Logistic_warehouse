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

def the_best_path(amount_of_magazines, magazine_number)
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
  index_of_the_magazine_location = $optimal_path.index(magazine_number)
  $optimal_path = $optimal_path.rotate(index_of_the_magazine_location)
  $optimal_path.push($optimal_path[0])
  return $optimal_distance, $optimal_path
end

def weight_of_all_packages(list_of_packages, magazine_number)
  i = 0
  sum_of_weights = 0
  list_of_packages.each do |packages|
    if i == magazine_number
      sum_of_weights += 0
    else
      packages.each do |package|
        sum_of_weights += package.weight
      end
    end
    i += 1
  end
  return sum_of_weights
end

def magazine_creation(list_of_packages)
  i = 0
  array_of_magazines = []
  list_of_packages.each do |packages| 
    array_of_magazines.push(Warehouse.new(packages))
  end
  return array_of_magazines

end

def magazine_packages_data(magazine)
  weight = 0
  value = 0
  amount_of_packages = magazine.list_of_packages.length
  magazine.list_of_packages.each { |package| value += package.value; weight += package.weight}
  print "To magazine located in ", magazine.location, ", has been delivered ", 
    amount_of_packages, " packages with total weight of ", weight, "kg and total value of ", 
    value, "zł.\n"
    return weight
end

def transport(weight, path, distance, logistic)
  amount_of_wagons = (weight.to_f / 15000).ceil

  train = Train.new(amount_of_wagons)
  i = 0
  path.each do |number| 
    if i == path.length-1
      next
    else
      magazine_packages_data(logistic[number])
      i += 1
    end
  end
  print"Cost of the transit equals ", train.cost_of_whole_transit(distance), "zł.\n"
end

def main
  amount_of_magazines = 16 # equal to amount of vertices
  amount_of_packages = 10000
  magazine_number = rand(0...amount_of_magazines) # number of first magazine
  magazine_number.to_int

  array_of_packages = packages_array_creation(amount_of_packages, amount_of_magazines)

  result_of_optimum_searching = the_best_path(amount_of_magazines, magazine_number)
  only_distance = result_of_optimum_searching[0]
  only_path = result_of_optimum_searching[1]

  whole_weight = weight_of_all_packages(array_of_packages, magazine_number)

  logistic = magazine_creation(array_of_packages)
  transport(whole_weight, only_path, only_distance, logistic)
end

main()