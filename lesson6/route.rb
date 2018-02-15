class Route
  include InstanceCounter

  attr_reader :stations, :name

  def initialize(a_station, b_station)
    @stations = [a_station, b_station]
    register_instanse
  end

  def route_list
    st_first = @stations.first
    st_last = @stations.last
    print "#{st_first.station} => #{st_last.station}"
  end

  def new_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def stations_display
    @stations.each_with_index { |station, index| puts "#{index += 1}) #{station.station};" }
  end
end




