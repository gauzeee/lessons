class Station
  include InstanceCounter

  attr_reader :station, :trains

  STATION_NAME = /^[А-Я]{1}[а-я]+$/

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
  rescue
    false
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

  def validate!
    raise "Название станции не может быть пустым" if station.nil?
    raise "Название станции должно быть на русском и начинаться с заглавной буквы" if station !~ STATION_NAME
    true
  end

  def station_to_all
    self.class.all ||= []
    self.class.all << self
  end
end
