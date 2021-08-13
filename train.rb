#!/usr/bin/env ruby

require './vehicles.rb'

class Train < Vehicles
  attr_accessor :combustion, :starting_cost, :capacity

  def initialize(amount_of_wagons)
    if amount_of_wagons > 10 
      amount_of_wagons = 10
      raise ArgumentError.new('You have only one train!')
    end
    @amount_of_wagons = amount_of_wagons
    @starting_cost = 2000 # starting cost of a train without wagons
    @capacity = 15000 * amount_of_wagons # capacity of train in kg
  end

  def cost_of_whole_transit(distance)
    if @amount_of_wagons > 6
      @starting_cost += (distance.to_f / 100).ceil * @amount_of_wagons * 80 # cost of starting the train and adding each wagon
    else
      @starting_cost += (distance.to_f / 100).ceil * @amount_of_wagons * 100
    end
    return @starting_cost
  end

end