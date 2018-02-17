require_relative 'company_name.rb'
require_relative 'instance_counter.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'coach.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_coach.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_coach.rb'

vsev = Station.new("Всеволожская")
berda = Station.new("Бернгардовка")
train11 = Train.new(NHK-12, "Passenger")
train12 = Train.new(NBA-11, "Cargo")
route = Route.new(vsev, berda)
puts "Станции:"
puts Station.all
puts Station.instances

puts "Поезда:"
puts Train.all
puts Train.instances
finder = Train.find(NBA-11)
puts finder
finder.company_name = "РЖД"
puts finder.company_name

puts "Maршруты:"
puts Route.instances
