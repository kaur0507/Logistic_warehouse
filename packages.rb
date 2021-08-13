#!/usr/bin/env ruby

class Package
  attr_accessor :destination, :weight, :value

  def initialize
    cities = ["Szczecin", "Kraków", "Katowice", "Olsztyn", "Opole", "Bydgoszcz", "Białystok", "Warszawa", "Kielce", "Lublin", "Łódź", "Rzeszów", "Zielona Góra", "Poznań", "Gdańsk", "Wrocław"]
    # choosing random city of destination, numbers for weight and value of package
    @destination = rand(0...cities.length) # random city number from 0 to 15 
    @weight = rand(1..10) # random weight from 1 to 10 in kg
    @value = rand(20..500) # random value from 20 to 500 in pln
  end
end
