#!/usr/bin/env ruby

class Vehicles

  @@price_of_fuel = 5.6 # price in PLN for 1 liter of fuel

  def initialize(combustion, capacity, starting_cost)
    @combustion = combustion # amount of liters of fuel per 100 km
    @capacity = capacity # capacity of vehicle in kg
    @starting_cost = starting_cost # cost of starting the vehicle
  end

  def cost_of_whole_transit(distance)
    return (@starting_cost + distance / 100 * @combustion * @@price_of_fuel).round(2)
  end

end