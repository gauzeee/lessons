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
require_relative 'train_to_do.rb'
require_relative 'routs_to_do.rb'
require_relative 'coach_to_do.rb'
require_relative 'station_to_do.rb'
require_relative 'acessors.rb'
require_relative 'validation.rb'
require_relative 'main.rb'

railway = Railway.new

moscow = Station.new('Moscow')
railway.stations << moscow
moon = Station.new('Moon')
railway.stations << moon
tr1 = Train.new('BPA-12', 'cargo')
tr1.driver = 'Nemo'
puts tr1.driver
route = Route.new(moscow, moon)
station_test = railway.stations[0]
station_test.name = 'Niobo'
station_test.name = 'Newyork'
station_test.name = 'Newyorker'
puts station_test.name_history
