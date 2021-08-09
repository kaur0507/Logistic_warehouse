# cities_in_order_of_graph = ["Szczecin", "Kraków", "Katowice", "Olsztyn", "Opole", "Bydgoszcz", "Białystok", "Warszawa", "Kielce", "Lublin", "Łódź", "Rzeszów", "Zielona Góra", "Poznań", "Gdańsk", "Wrocław"]


class Graph

  INFINITY = 1 << 64

  DISTANCE = [[0, 0, 0, 0, 0, 258, 0, 0, 0, 0, 0, 0, 220, 272, 361, 0], 
            [0, 0, 80, 0, 0, 0, 0, 0, 161, 0, 205, 0, 0, 0, 0, 0], 
            [0, 80, 0, 0, 111, 0, 0, 0, 161, 0, 205, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 232, 239, 211, 0, 0, 0, 0, 0, 0, 181, 0], 
            [0, 0, 111, 0, 0, 0, 0, 0, 0, 0, 208, 0, 0, 285, 0, 98], 
            [258, 0, 0, 232, 0, 0, 0, 305, 0, 0, 224, 0, 0, 139, 167, 0],
            [0, 0, 0, 239, 0, 0, 0, 199, 0, 325, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 211, 0, 305, 199, 0, 176, 172, 139, 0, 0, 0, 0, 0], 
            [0, 121, 161, 0, 0, 0, 0, 176, 0, 189, 151, 158, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 325, 172, 189, 0, 0, 164, 0, 0, 0, 0], 
            [0, 266, 205, 0, 208, 224, 0, 139, 151, 0, 0, 0, 0, 202, 0, 0], 
            [0, 169, 0, 0, 0, 0, 0, 0, 158, 164, 0, 0, 0, 0, 0, 0], 
            [220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, 0, 188], 
            [272, 0, 0, 0, 285, 139, 0, 0, 0, 0, 202, 0, 154, 0, 0, 182], 
            [361, 0, 0, 181, 0, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 98, 0, 0, 0, 0, 0, 0, 0, 188, 182, 0, 0]]

  def shortest_distance_between_cities(initial_value, matrix = DISTANCE)
    distance = Array.new(matrix.size, INFINITY)
    previous = Array.new(matrix.size, -1)

    distance[initial_value] = 0

    3.times { distance, previous = search_distance_between_cities(distance, previous, matrix) }
    [distance, previous]
  end

  def search_distance_between_cities(distance, previous, matrix)
    vertex = Array(0...matrix.size)
    until vertex.empty?
      u = vertex.shift
      matrix[u].each_with_index do |val, i|
        next if val.zero?

        alt = distance[u] + val
        if alt < distance[i]
          distance[i] = alt
          previous[i] = u
        end
      end
    end
    [distance, previous]
  end

  def find_the_shortest_path(beginning, last)

    if beginning == last
      return -1
    end

    path = shortest_distance_between_cities(beginning)[1]
    previous = last
    route = [last]
    while previous != beginning
      route << path[previous]
      previous = path[previous]
    end
    route.reverse!
  end
end