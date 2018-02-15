class Train
  include CompanyName
  include InstanceCounter

  attr_reader :num, :type, :coaches, :speed

  class << self
    attr_accessor :all

    def find(num)
      all[num]
    end
  end

  def initialize(num, type)
    @num = num
    @type = type
    @coaches = []
    @speed = 0
    register_instanse
    train_to_all
  end

  def speed_up(speed)
    @speed += speed
  end

  def speed_down(speed)
    delta_speed = @speed - speed
    if delta_speed > 0
      @speed -= speed
    else
      @speed = 0
    end
  end

  def stop
    @speed = 0
  end

  def coach_in(coach)
    @coaches << coach if @speed == 0 && self.type == coach.type
  end

  def coach_out(coach)
    @coaches.slice!(coach) if @speed == 0 && @coaches.any?
  end

  def get_route(route)
    @route = route
    @station_number = 0
    current_station.train_in(self)
  end

  def current_station
    @route.stations[@station_number]
  end

  def go_next_station
    if current_station != @route.stations.last
      current_station.train_out(self)
      @station_number += 1
      current_station.train_in(self)
   end
  end

  def go_prev_station
    if current_station != @route.stations.first
      current_station.train_out(self)
      @station_number -= 1
      current_station.train_in(self)
    end
  end

  def next_station
    @route.stations[@station_number + 1] if current_station != @route.stations.first
  end

  def prev_station
    @route.stations[@station_number - 1] if current_station != @route.stations.last
  end

  protected

  def train_to_all
    self.class.all ||= {}
    self.class.all[num] = self
  end

end
