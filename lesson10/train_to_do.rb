module TrainToDo
  attr_reader :num, :train_index, :coach_index,
              :current_train, :coach, :move_choice, :type

  def new_train_in
    puts 'Enter number of new train'
    @num = gets.chomp
    puts 'Choose 1 to add CARGO train'
    puts 'Choose 2 to add PASSENGER train'
    type_choice = gets.chomp.to_i
    train = Train.new(@num, 'cargo') if type_choice == 1
    train = Train.new(@num, 'passenger') if type_choice == 2
    @trains << train
  end

  def new_train
    new_train_in
    puts "Train #{num} has been added!"
  rescue RuntimeError => e
    puts e
    retry
  end

  def choose_train
    if @trains.empty?
      puts 'No trains'
    else
      puts 'Trains list:'
      train_list
      puts 'Choose index of train:'
      @train_index = gets.to_i
      @current_train = @trains[@train_index - 1]
    end
  end

  def choose_coach
    coaches_list
    puts 'Choose coach index:'
    @coach_index = gets.to_i
    if !@coaches[coach_index - 1].nil?
      @coach = @coaches[coach_index - 1]
    else
      puts 'Incorrect input. Repeat:'
    end
  end

  def where_is_train
    puts "Train №#{current_train.num} now at:"
    puts "#{current_train.current_station.station} station"
  end

  def move_to
    puts 'Enter 1 to go next station'
    puts 'Enter 2 to go previous station'
    @move_choice = gets.to_i
  end
end
