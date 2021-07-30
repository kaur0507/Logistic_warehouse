#!/usr/bin/env ruby

require './vehicles.rb'

class Truck < Vehicles
  attr_accessor :combustion, :price_of_fuel, :capacity

  def initialize
    @combustion = rand(5.0..8.3).round(2) # random amount of liters of fuel per 100 km
    @price_of_fuel = 5.6 # price in PLN for 1 liter of fuel
    @capacity = 3000 # capacity of truck in kg
    @starting_cost = 200 # cost of starting the truck
  end

  def cost_of_whole_transit(distance)
    return @starting_cost + distance / 100 * @combustion * @price_of_fuel
  end
end


# truck = Truck.new
# puts truck.combustion
# puts truck.price_of_fuel
