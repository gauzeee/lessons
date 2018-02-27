module Menu
  MENU_POINTS = [
    'Welcome to Railway Control System!', 'What you like to do?',
    'Choose 1 to add new station', 'Choose 2 to add new train',
    'Choose 3 to add new route', 'Choose 4 to edit routes',
    'Choose 5 to get route for train', 'Choose 6 to add new coach',
    'Choose 7 to add some coaches to train', 'Choose 8 to unhook a coach',
    'Choose 9 to move train', 'Choose 10 to look stations list',
    'Choose 11 to look trains list', 'Choose 12 to look coaches list',
    'Choose 13 to add passenger or load cargo'
  ].freeze
  MENU_METODS = {
    '1' => :new_station, '2' => :new_train, '3' => :new_route,
    '4' => :edit_route, '5' => :set_route, '6' => :new_coach,
    '7' => :add_coaches, '8' => :remove_coaches, '9' => :move_train,
    '10' => :stations_list, '11' => :trains_on_station_list,
    '12' => :train_coaches_list, '13' => :fill_coach, 'm' => :menu
  }.freeze

  def menu
    MENU_POINTS.each { |point| puts point }
    loop do
      puts 'm MENU; e EXIT;'
      to_do = gets.chomp
      break if to_do == 'e'
      send MENU_METODS[to_do]
    end
  end
end
