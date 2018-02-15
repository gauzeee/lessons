require_relative 'company_name.rb'
require_relative 'instance_counter.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'coach.rb'
require_relative 'passengertrain.rb'
require_relative 'passengercoach.rb'
require_relative 'cargotrain.rb'
require_relative 'cargocoach.rb'

vsev = Station.new("Всеволожская")
berda = Station.new("Бернгардовка")
train11 = Train.new(11, "Passenger")
train12 = Train.new(12, "Cargo")
route = Route.new(vsev, berda)
puts "Станции:"
puts Station.all
puts Station.instances

puts "Поезда:"
puts Train.all
puts Train.instances
finder = Train.find(11)
puts finder
finder.company_name = "РЖД"
puts finder.company_name

puts "Maршруты:"
puts Route.instances
