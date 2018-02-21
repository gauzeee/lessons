module StationToDo
  def new_station
    puts 'Choose name of new station'
    add_station = gets.chomp
    @stations << Station.new(add_station)
    puts "Station #{add_station} has been added!"
  rescue RuntimeError => e
    puts e
    retry
  end
end
