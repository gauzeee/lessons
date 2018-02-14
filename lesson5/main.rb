require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'passengertrain.rb'
require_relative 'passengercoach.rb'
require_relative 'cargotrain.rb'
require_relative 'cargocoach.rb'

class Railway

  def initialize
    @trains = []
    @stations =[]
    @routes = []
  end

  def menu
    puts "Добро пожаловать в систему управления!"
    puts "Что вы хотите сделать?"
    puts "Введите 1 для добавления новой станции"
    puts "Введите 2 для добавления нового поезда"
    puts "Введите 3 для создания нового маршрута"
    puts "Введите 4 для редактирования имеющегося маршрута"
    puts "Введите 5, что бы назначить маршрут поезду"
    puts "Введите 6 для добавления вагонов к поезду"
    puts "Введите 7 для отцепления вагонов"
    puts "Введите 8 для перемещения поезда по маршруту"
    puts "Введите 9 для просмотра списка станций"
    puts "Введите 10 для просмотра списка поездов на станции"
      loop do
      puts "0 МЕНЮ; 66 ВЫЙТИ;"
      to_do = gets.chomp.to_i
      if to_do == 1
        new_station
      elsif to_do == 2
        new_train
      elsif to_do == 3
        new_route
      elsif to_do == 4
        redact_route
      elsif to_do == 5
        get_route
      elsif to_do == 6
        add_coaches
      elsif to_do == 7
        remove_coaches
      elsif to_do == 8
        move_train
      elsif to_do == 9
        stations_list
      elsif to_do == 10
        trains_on_station_list
      elsif to_do == 0
        menu
      elsif to_do == 66
        exit
      else
        puts "Ошибка! Повторите ввод."
        menu
      end
    end
  end

  def new_station
    puts "Введите название для новой станции"
    add_station = gets.chomp
    @stations << Station.new(add_station)
    puts "Станция #{add_station} успешно добавлена!"
  end

  def new_train
    puts "Введите номер поезда"
    num = gets.chomp.to_i
    puts "Введите 1, если хотите добавить ГРУЗОВОЙ поезд"
    puts "Введите 2, если хотите добавить ПАССАЖИРСКИЙ поезд"
    type_choice = gets.chomp.to_i
    if type_choice == 1
      type = "Cargo"
      train = CargoTrain.new(num, type)
      @trains << train
      puts "Грузовой поезд №#{num} успешно добавлен!"
    elsif type_choice == 2
      type = "Passenger"
      train = PassengerTrain.new(num, type)
      @trains << train
      puts "Пассажирский поезд №#{num} успешно добавлен!"
    else
    puts "Ошибка! Повторите ввод."
    new_train
    end
  end

  def stations_list
    if @stations.empty?
      puts "Ни одной станции не создано"
    else
    @stations.each_with_index { |stat, index| puts "Станция №#{index + 1}: #{stat.station}"}
    end
  end

  def new_route
    if @stations.count < 2
      puts "Для создания маршрута нужно создать не менее двух станций"
      new_station
    else
      stations_list
      puts "Выберете номер станции отправления"
      a_station_index = gets.to_i
      if @stations.include?( @stations[a_station_index - 1] )
        a_station = @stations[a_station_index - 1]
      else
        puts "Ошибка! Попробуйте еще."
        new_route
      end
      puts "Выберете номер станции назначения"
      b_station_index = gets.to_i
      if @stations.include?( @stations[b_station_index - 1] )
        b_station = @stations[b_station_index - 1]
      else
        puts "Ошибка! Попробуйте еще."
        new_route
      end
      route = Route.new(a_station, b_station)
      @routes << route
      puts "Маршрут от станции #{a_station.station} до станции #{b_station.station} успешно построен."
    end
  end

  def routes_list
      puts "Список текущих маршрутов:"
      @routes.each_with_index { |route, index| puts " :#{index + 1} Маршрут #{route.route_list}"}
  end

  def redact_route
    if @routes.empty?
      puts "Отсутствуют маршруты для изменения"
    else
      routes_list
      puts "Выберете номер маршрута для редактирования"
      route_index = gets.to_i
      current_route = @routes[route_index - 1]
      if @routes.include?(current_route)
        puts "Текущие станции маршрута"
        current_route.stations_display
        puts "Введите 1 для добавления станции в маршрут"
        puts "Введите 2 для удаления стации из маршрута"
        redact_route_choise = gets.to_i
        if redact_route_choise == 1
          puts "Список станций:"
          stations_list
          puts "Введите номер станции для добавления"
          to_route = gets.to_i
          current_route.new_station(@stations[to_route - 1])
          puts "Станция добавлена. Текущие станции маршрута:"
          current_route.stations_display
        elsif redact_route_choise == 2
          puts "Список станций:"
          stations_list
          puts "Введите номер станции для удаления"
          out_route = gets.to_i
          current_route.remove_station(@stations[out_route - 1])
          puts "Станция удалена. Текущие станции маршрута:"
          current_route.stations_display
        else
          puts "Ошибка. Введите верные данные."
          redact_route
        end
      else
        puts "Ошибка! Повторите"
        redact_route
      end
    end
  end

  def train_list
      @trains.each_with_index { |train, index| puts "#{index + 1}) Поезд №#{train.num} #{train.type}"}
  end

  def get_route
    if @trains.empty?
      puts "Нет ни одного поезда. Создайте поезд."
      new_train
    else
      puts "Список поездов:"
      train_list
      puts "Выберете индекс поезда для задания ему маршрута"
      num = gets.to_i
      if @trains.count >= num
        if @routes.empty?
          puts "Не создано ни одного маршрута"
          new_route
        else
          routes_list
          puts "Выберете номер маршрута для поезда #{@trains[num - 1].num}"
          train_route_choice = gets.to_i
          train_current_route = @routes[train_route_choice - 1]
          @trains[num - 1].get_route(train_current_route)
          puts "  Маршрут #{train_current_route.route_list}назначен Поезду #{@trains[num - 1].num}"
        end
      else
        puts "Ошибка! Повторите ввод!"
        get_route
      end
    end
  end

  def add_coaches
    if @trains.empty?
      puts "Вагоны можно добавить к поезду. Для этого создайте поезд"
      new_train
    else
      puts "Список поездов:"
      train_list
      puts "Введите индекс поезда для добавления вагонов"
      num = gets.to_i
      if @trains.count >= num
        current_train = @trains[num - 1]
        if current_train.class == CargoTrain
          current_train.coach_in(CargoCoach.new)
          puts "К поезду №#{current_train.num} прицеплен один ГРУЗОВОЙ вагон."
        else
          current_train.coach_in(PassengerCoach.new)
          puts "К поезду №#{current_train.num} прицеплен один ПАССАЖИРСКИЙ вагон."
        end
      end
    end
  end

  def remove_coaches
    if @trains.empty?
      puts "Нет поездов - нет вагонов."
      new_train
    else
      puts "Список поездов:"
      train_list
      puts "Введите индекс поезда для отцепления вагонов"
      num = gets.to_i
      if @trains.count >= num
        current_train = @trains[num - 1]
        if current_train.coaches.count > 0
          current_train.coach_out
          puts "От поезда #{current_train.num} отцеплен один вагон."
        else
          puts "Все вагоны уже отцеплены"
        end
      else
        puts "Ошибка! Не верный индекс."
      end
    end
  end

  def move_train
    if @trains.empty?
      puts "Не создано поездов, нечему ехать"
      new_train
    elsif @routes.empty?
      puts "Еще не создано маршрутов"
      new_route
    elsif @stations.empty?
      puts "Еще не создано станций"
      new_station
    else
      puts "Список поездов:"
      train_list
      puts "Введите индекс поезда, который поедет на другую станцию"
      num = gets.to_i
      current_train = @trains[num - 1]
      if @trains.count >= num && @trains[num - 1].route?
        puts "Введите 1 для движения на следующую станцию"
        puts "Введите 2 для движения на предыдущую станцию"
        move_choice = gets.to_i
        if move_choice == 1
          current_train.go_next_station
          puts "Поезд №#{current_train.num} приехал на станцию #{current_train.current_station.station}"
        elsif move_choice == 2
          current_train.go_prev_station
          puts "Поезд №#{current_train.num} приехал на станцию #{current_train.current_station.station}"
        else
          puts "Ошибка! Повторите ввод."
          move_train
        end
      else
        puts "Ошибка! Неверный индекс или поезду не назначен маршрут."
        move_train
      end
    end
  end

  def trains_on_station_list
    if @stations.empty?
      puts "Не создано станций"
      new_station
    else
      puts "Список станций:"
      stations_list
      puts "Выберете индекс станции для просмотра списка поездов на ней"
      station_look = gets.to_i
      puts "На стации #{@stations[station_look - 1].station} находятся:"
      @stations[station_look - 1].trains_list
    end
  end
end

railway_system = Railway.new
railway_system.menu
