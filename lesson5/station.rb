class Station
  attr_reader :station, :trains

  def initialize(station)
    @station = station
    @trains = []
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
end
