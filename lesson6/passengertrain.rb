class PassengerTrain < Train
  attr_reader :coaches

  def initialize(num)
    @num = num
    @type = "Passenger"
    @coaches = []
    @speed = 0
  end
end
