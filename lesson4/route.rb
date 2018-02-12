class Route

  attr_reader :route_list

  def initialize(a_station, b_station)
    @a_station = a_station
    @b_station = b_station
    @@route_list = []
    @@route_list[0] = a_station
    @@route_list[-1] = b_station
  end

  def new_route_point(station_name)
    @@route_list << station_name
  end

  def remove_route_point(station_name)
    @@route_list.delete(station_name)
  end

  def route_list_display
    @@route_list.each_with_index { |station_name| puts station_name }
  end

end
