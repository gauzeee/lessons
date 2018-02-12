class Station

  attr_reader :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def train_in(train)
    @trains << train
  end

  def trains_list
    @trains.each { |train| puts "Поезд #{train.number} #{train.type} типа; #{train.coaches} вагонов." }
  end

  def train_type(type)
    train_type_count = 0
    @trains.each { |train| train_type_count += 1 if train.type.eqlual?(type) }
    puts "Сейчас на станции #{@station_name} #{train_type_count} поездов #{type} типа."
  end

  def train_out(train)
    @trains.delete(train)
  end

end
