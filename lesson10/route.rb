class Route
  include InstanceCounter

  attr_reader :stations, :name, :a_station, :b_station

  def initialize(a_station, b_station)
    @stations = [a_station, b_station]
    validate!
    register_instanse
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def route_list
    st_first = @stations.first
    st_last = @stations.last
    print "#{st_first.name} => #{st_last.name}"
  end

  def new_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def stations_display
    @stations.each_with_index do |station, index|
      puts "#{index + 1}) #{station.name};"
    end
  end

  private

  def validate!
    raise 'Station does not exist' if @stations.any?(&:nil?)
    raise 'No Stations' if @stations.any? { |s| !s.instance_of? Station }
    raise 'Need different start & end' if @stations.first == @stations.last
    true
  end
end
