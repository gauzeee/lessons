require_relative 'acessors.rb'
require_relative 'validation.rb'

class Station
  include InstanceCounter
  include Validation
  include Accessors

  attr_accessor_with_history :name, :trains

  STATION_NAME = /^[A-Z]{1}[a-z]+$/

  class << self
    attr_accessor :all
  end

  validate :name, :presence
  validate :name, :format, STATION_NAME

  def initialize(name)
    @name = name
    @trains = []
    validate!
    register_instanse
    station_to_all
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

  def station_to_all
    self.class.all ||= []
    self.class.all << self
  end
end
