class Station
  include InstanceCounter

  attr_reader :station, :trains

class << self
  attr_accessor :all
end

  def initialize(station)
    @station = station
    @trains = []
    register_instanse
    sum_stations
  end

  def train_in(train)
    @trains << train
  end

  def trains_list
    @trains.each { |x| puts "Поезд №#{x.num}" }
  end

  def train_out(train)
    @trains.delete(train)
  end

  private

  def sum_stations
    self.class.all = [] if self.class.all == nil
    self.class.all << self
  end
end
