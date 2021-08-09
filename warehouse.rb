#!/usr/bin/env ruby

class Warehouse
  @@number_of_warehouse = 0
  def initialize(location, list_of_packages, means_of_transport, forwarding_allocation)
    cities = ["Kraków", "Kielce", "Łódź", "Lublin", "Warszawa", "Szczecin", "Bydgoszcz", "Białystok", "Olsztyn", "Rzeszów", "Gdańsk", "Zielona Góra", "Poznań", "Opole", "Wrocław", "Katowice"]
    @@number_of_warehouse += 1
  end

end