#!/usr/bin/env ruby

class Package
  attr_accessor :destination, :weight, :value

  def initialize
    cities = ["Kraków", "Kielce", "Łódź", "Lublin", "Warszawa", "Szczecin", "Bydgoszcz", "Białystok", "Olsztyn", "Rzeszów", "Gdańsk", "Zielona Góra", "Poznań", "Opole", "Wrocław", "Katowice"]
    # choosing random city of destination, numbers for weight and value of package
    @destination = cities.sample # random city from the array of 16 chosen
    @weight = rand(1..10) # random weight from 1 to 10 in kg
    @value = rand(20..500) # random value from 20 to 500 in pln
  end

end

package = Package.new
puts package.destination
puts package.weight
puts package.value