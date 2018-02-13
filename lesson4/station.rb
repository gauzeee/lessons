class Station
  attr_reader :station, :trains

  def initialize(station)
    @station = station
    @trains = []
  end

  def train_in(train)
    @trains << train
  end

  def trains_list(type)
    @trains.count { |train| train.type == type }
  end

  def train_out(train)
    @trains.delete(train)
  end
end
