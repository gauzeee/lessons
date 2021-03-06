class Route
  attr_reader :stations

  def initialize(a_station, b_station)
    @stations = [a_station, b_station]
  end

  def new_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def stations_display
    @stations.each_with_index { |station, index| puts "#{index += 1})#{station};" }
  end
end




