class Train

  attr_reader :num, :type, :coaches, :current_speed, :i
  attr_accessor :speed, :route

  def initialize(num, type, coaches)
    @num = num
    @type = type
    @coaches = coaches
    @speed = 0
    @i = 0
  end

  def speed_up(speed)
    @speed += speed
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def coaches_sum
    @coaches
  end

  def coach_in
    @coaches += 1 if @speed == 0
  end

  def coach_out
    @coaches -= 1 if @speed == 0
  end

  def show_route
    route.route_list
  end

  def departure_station
    @current_station = route.route_list[0]
  end

  def go_next_station
     @i += 1
     @current_station = route.route_list[@i]
  end

  def go_prev_station
    if @i >= 1
     @i -= 1
     @current_station = route.route_list[@i]
  end

  def next_station
    puts "Следующая станция #{route.route_list[@i + 1].station_name}."
  end

  def prev_station
    puts "Предидущая станция #{route.route_list[@i - 1].station_name}."
  end

end
