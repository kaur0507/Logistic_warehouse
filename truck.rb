#!/usr/bin/env ruby

require './vehicles.rb'

class Truck < Vehicles
  attr_accessor :combustion, :capacity, :starting_cost

  def initialize
    @combustion = rand(5.0..8.3).round(2) # amount of liters of fuel per 100 km
    @capacity = 3000 # capacity of truck in kg
    @starting_cost = 200 # cost of starting a truck
  end

end


truck = Truck.new
puts truck.combustion
puts truck.cost_of_whole_transit(200)
