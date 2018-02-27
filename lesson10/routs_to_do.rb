module RoutsToDo
  attr_reader :route_index, :a_station_index, :to_route,
              :b_station_index, :a_station, :b_station, :current_route

  def new_route
    stations_list
    stations_to_rout
    route = Route.new(a_station, b_station)
    @routes << route
    puts "Route #{a_station.name} - #{b_station.name} added."
  rescue StandardError => e
    puts e
  end

  def choose_route
    routes_list
    puts 'Choose number of route:'
    @route_index = gets.to_i
    @current_route = @routes[@route_index - 1]
  end

  def stations_to_rout
    puts 'Choose number of departure station'
    @a_station_index = gets.to_i
    @a_station = @stations[@a_station_index - 1]
    puts 'Choose number of arrive station'
    @b_station_index = gets.to_i
    @b_station = @stations[@b_station_index - 1]
  end

  def stations_edit_route
    puts 'Stations list:'
    stations_list
    puts 'Choose number of station:'
    @to_route = gets.to_i
  end

  def edit_route
    choose_route
    puts 'Current stations:'
    current_route.stations_display
    puts 'Enter 1 to add station'
    puts 'Enter 2 to remove station'
    redact_route_choise = gets.to_i
    add_station_to_route if redact_route_choise == 1
    remove_station_from_route if redact_route_choise == 2
  end

  def add_station_to_route
    stations_edit_route
    current_route.new_station(@stations[to_route - 1])
    puts 'Station has been added! Current stations:'
    current_route.stations_display
  end

  def remove_station_from_route
    stations_edit_route
    current_route.remove_station(@stations[to_route - 1])
    puts 'Station has been removed! Current stations:'
    current_route.stations_display
  end
end
