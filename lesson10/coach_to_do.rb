module CoachToDo
  attr_reader :vol, :coach_choice, :coaches, :coach, :coach_index

  def new_coach
    puts 'Enter 1 to add CARGO coach'
    puts 'Enter 2 to add PASSENGER coach'
    coach_choice = gets.to_i
    new_cargo_coach if coach_choice == 1
    new_passenger_coach if coach_choice == 2
  rescue StandardError => e
    puts e
  end

  def add_coaches
    choose_train
    if @coaches.empty?
      puts 'No coaches'
    else
      choose_coach
      move_coaches
    end
  end

  def remove_coaches
    train_coaches_list
    @coach_choice = gets.to_i
    puts 'Incorrect input or no more coaches!' unless coach?
    move_out_coach if coach?
  end

  def new_cargo_coach
    puts 'Enter volume of new coach'
    vol = gets.to_i
    coach = CargoCoach.new(vol)
    @coaches << coach
    puts "There are new CARGO coach for #{coach.free_space} litres."
  end

  def cargo?
    current_train.class == CargoTrain && coach.type == 'cargo'
  end

  def passenger?
    current_train.class == PassengerTrain && coach.type == 'passenger'
  end

  def new_passenger_coach
    puts 'Enter number of seats'
    seat = gets.to_i
    coach = PassengerCoach.new(seat)
    @coaches << coach
    puts "There are new PASSENGER coach for #{coach.free_space} seats"
  end

  def fill_cargo_coach
    puts 'Volume of new cargo?'
    @vol = gets.to_i
    if @vol > coach.free_space
      puts 'Not enough space'
    else
      puts 'Cargo added!'
      coach.take_space(@vol)
    end
  end

  def fill_passenger_coach
    if coach.free_space > 0
      coach.take_space
      puts 'One more passenger take a seat'
    else
      puts 'Not enough seats'
    end
  end

  def move_coaches
    if cargo? || passenger?
      current_train.coach_in(@coach)
      @coaches.slice!(coach_index - 1)
      puts "Train №#{current_train.num} nave new coach."
    else
      puts 'Wrong type!'
    end
  end

  def move_out_coach
    @coaches << current_train.coaches[coach_choice - 1]
    current_train.coach_out(coach_choice - 1)
    puts "Train #{current_train.num} left one coach."
  end

  def coach?
    !current_train.coaches[coach_choice - 1].nil?
  end
end
