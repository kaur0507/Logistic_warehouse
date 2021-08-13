#!/usr/bin/env ruby

class Vehicles

  def initialize()
    @price_of_fuel = 5.6 # price in PLN for 1 liter of fuel
    @combustion = 0 # amount of liters of fuel per 100 km
    @capacity = 0 # capacity of vehicle in kg
    @starting_cost = 0 # cost of starting the vehicle
  end

  def cost_of_whole_transit(distance)
    return (@starting_cost + distance / 100 * @combustion * @price_of_fuel).round(2)
  end

end