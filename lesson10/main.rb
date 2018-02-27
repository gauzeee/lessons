require_relative 'company_name.rb'
require_relative 'instance_counter.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'coach.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_coach.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_coach.rb'
require_relative 'menu.rb'
require_relative 'train_to_do.rb'
require_relative 'routs_to_do.rb'
require_relative 'coach_to_do.rb'
require_relative 'station_to_do.rb'

class Railway
  include TrainToDo
  include RoutsToDo
  include CoachToDo
  include StationToDo
  include Menu

  attr_reader :stations

  def initialize
    @trains = []
    @stations = []
    @routes = []
    @coaches = []
  end

  def stations_list
    @stations.each_with_index do |stat, index|
      puts "Station №#{index + 1}: #{stat.station}"
    end
  end

  def routes_list
    puts 'Routes list:'
    @routes.each_with_index do |route, index|
      puts ": #{index + 1} route #{route.route_list}"
    end
  end

  def train_list
    @trains.each_with_index do |train, index|
      puts "#{index + 1}) Train №#{train.num} #{train.type}"
    end
  end

  def set_route
    choose_train
    choose_route unless @trains.empty?
    train_current_route = @routes[route_index - 1]
    @trains[train_index - 1].get_route(train_current_route)
    who_get_route(train_current_route)
  rescue StandardError => e
    puts e
  end

  def who_get_route(train_current_route)
    puts " route #{train_current_route.route_list}gets to"
    puts "train #{@trains[train_index - 1].num}"
  end

  def coaches_list
    if @coaches.empty?
      puts 'No more coaches'
    else
      puts 'Coaches list:'
      @coaches.each_with_index do |coach, index|
        puts "#{index + 1}) #{coach.type} #{coach.free_space}"
      end
    end
  end

  def train_coaches_list
    choose_train
    @trains[@train_index - 1].train_coaches_list do |coach, index|
      puts "Coach №#{index + 1} #{coach.type};"
      puts "Free: #{coach.free_space};"
      puts "Busy: #{coach.busy_space};"
    end
  end

  def fill_coach
    train_coaches_list
    puts 'Choose coach number to add passenger or cargo:'
    coach_num = gets.to_i
    coach = @trains[@train_index - 1].coaches[coach_num - 1]
    fill_right(coach)
  rescue StandardError => e
    puts e
  end

  def fill_right(coach)
    fill_cargo_coach if coach.class == CargoCoach
    fill_passenger_coach if coach.class == PassengerCoach
  end

  def move_train
    choose_train
    move_to
    if move_choice == 1
      current_train.go_next_station
    elsif move_choice == 2
      current_train.go_prev_station
    else
      puts 'Incorrect input!'
    end
    where_is_train
  end

  def trains_coaches_list(station_look)
    puts "Trains on #{@stations[station_look - 1].station}:"
    @stations[station_look - 1].station_trains_list do |train|
      puts "Train №#{train.num} #{train.type} #{train.coaches.count} coaches"
    end
  end

  def trains_on_station_list
    puts 'Stations list:'
    stations_list
    puts 'Choose station index to look trains list'
    station_look = gets.to_i
    trains_coaches_list(station_look)
  end
end

railway_system = Railway.new
# railway_system.menu
