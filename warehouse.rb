#!/usr/bin/env ruby

class Warehouse
  @@number_of_warehouse = -1
  def initialize(list_of_packages)
    cities = ["Szczecin", "Kraków", "Katowice", "Olsztyn", "Opole", "Bydgoszcz", "Białystok", "Warszawa", "Kielce", "Lublin", "Łódź", "Rzeszów", "Zielona Góra", "Poznań", "Gdańsk", "Wrocław"]
    @@number_of_warehouse += 1
    @ordinal_number = @@number_of_warehouse
    @location = cities[@ordinal_number]
    @list_of_packages = list_of_packages
  end

  def location
    @location
  end
  def ordinal_number
    @ordinal_number
  end
  def list_of_packages
    @list_of_packages
  end

end