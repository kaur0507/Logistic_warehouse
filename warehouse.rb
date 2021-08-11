#!/usr/bin/env ruby

class Warehouse
  @@number_of_warehouse = -1
  def initialize(list_of_packages, means_of_transport, forwarding_allocation)
    cities = ["Szczecin", "Kraków", "Katowice", "Olsztyn", "Opole", "Bydgoszcz", "Białystok", "Warszawa", "Kielce", "Lublin", "Łódź", "Rzeszów", "Zielona Góra", "Poznań", "Gdańsk", "Wrocław"]
    @@number_of_warehouse += 1
    @location = cities[@@number_of_warehouse]
    @list_of_packages = list_of_packages
  end

end