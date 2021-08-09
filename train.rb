#!/usr/bin/env ruby

require './vehicles.rb'

class Train < Vehicles
  attr_accessor :combustion, :starting_cost, :capacity

  def initialize(amount_of_wagons)
    @combustion = rand(5.0..8.3).round(2) # random amount of liters of fuel per 100 km
    if amount_of_wagons > 6
      @starting_cost = 2000 + amount_of_wagons * 80 # cost of starting the train and adding each wagon
    else
      @starting_cost = 2000 + amount_of_wagons * 100
    end
    @capacity = 15000 * amount_of_wagons # capacity of train in kg
  end

  def cost_of_whole_transit
    return @starting_cost
  end

end

train = Train.new(3)
puts train.cost_of_whole_transit