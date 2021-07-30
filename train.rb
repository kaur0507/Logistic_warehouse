#!/usr/bin/env ruby

require './vehicles.rb'

class Train < Vehicles
  attr_accessor :combustion, :price_of_fuel, :starting_cost, :capacity

  def initialize(amount_of_wagons)
    @combustion = rand(5.0..8.3).round(2) # random amount of liters of fuel per 100 km
    @price_of_fuel = 5.6 # price in PLN for 1 liter of fuel
    if amount_of_wagons > 6
      @starting_cost = 2000 + amount_of_wagons * 80 # cost of starting the train and adding each wagon
    else
      @starting_cost = 2000 + amount_of_wagons * 100
    end
    @capacity = 15000 * amount_of_wagons # capacity of train in kg
  end

end