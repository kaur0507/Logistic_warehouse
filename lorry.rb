#!/usr/bin/env ruby

require './vehicles.rb'

class Lorry < Vehicles
  attr_accessor :combustion, :price_of_fuel, :capacity, :starting_cost

  def initialize(amount_of_semitrailers)
    @combustion = 25.3 # liters of fuel per 100 km
    @price_of_fuel = 5.6 # price in PLN for 1 liter of fuel
    @starting_cost = 1000 + amount_of_semitrailers * 200 # cost of starting the lorry and adding each semitrailer
    @capacity = 12000 * amount_of_semitrailers # capacity of lorry in kg
  end

  def cost_of_whole_transit(distance)
    return @starting_cost + distance / 100 * @combustion * @price_of_fuel
  end
end