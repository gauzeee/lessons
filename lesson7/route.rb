class Route
  include InstanceCounter

  attr_reader :stations, :name, :station, :a_station, :b_station

  def initialize(a_station, b_station)
    @stations = [a_station, b_station]
    validate!
    register_instanse
  end

  def valid?
    validate!
  rescue
    false
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

  private

  def validate!
    raise "Начальная или конечная станция не существует" if @stations.any?(&:nil?)
    raise "Для создания маршрута нужны станции" unless @stations.any? { |station| station.instance_of? Station }
    raise "В маршруте должны быть разные начальная и конечная станции" if @stations.first == @stations.last
    true
  end
end




