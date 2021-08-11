#!/usr/bin/env ruby

require './packages.rb'

def packages_creation(amount_of_packages, number_of_magazines)

  packages_located_by_destination = Array.new(number_of_magazines){Array.new(0)}

  for i in (0...amount_of_packages) do
    package = Package.new
    packages_located_by_destination[package.destination].push(package)
  end
  packages_located_by_destination
end

number_of_magazines = 16
amount_of_packages = 10000

array = packages_creation(amount_of_packages, number_of_magazines)

# array.each do |packages| 
#   for i in (0...packages.length) 
#     puts packages[i].value
#   end
# end