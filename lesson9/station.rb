class Station
  include InstanceCounter

  attr_reader :station, :trains

  STATION_NAME = /^[A-Z]{1}[a-z]+$/

  class << self
    attr_accessor :all
  end

  def initialize(station)
    @station = station
    @trains = []
    validate!
    register_instanse
    station_to_all
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def station_trains_list
    @trains.each { |train| yield(train) }
  end

  def train_in(train)
    @trains << train
  end

  def trains_list
    @trains.each do |train|
      puts "Train №#{train.num} #{train.type} #{train.coaches.count} coaches"
    end
  end

  def train_out(train)
    @trains.delete(train)
  end

  private

  def validate!
    raise 'Name can`t be empty' if station.nil?
    raise 'Name must have capital letter first' if station !~ STATION_NAME
    true
  end

  def station_to_all
    self.class.all ||= []
    self.class.all << self
  end
end
