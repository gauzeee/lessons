class PassengerTrain < Train
  attr_reader :coaches


  def initialize(num)
    @num = num
    @type = "пассажирский"
    @coaches = []
    @speed = 0
    validate!
  end
end
