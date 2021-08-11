#!/usr/bin/env ruby

require './vehicles.rb'

class Lorry < Vehicles
  attr_accessor :combustion, :capacity, :starting_cost

  def initialize(amount_of_semitrailers)
    @combustion = 25.3 # liters of fuel per 100 km
    @starting_cost = 1000 + amount_of_semitrailers * 200 # cost of starting the lorry and adding each semitrailer
    @capacity = 12000 * amount_of_semitrailers # capacity of lorry in kg
  end

end