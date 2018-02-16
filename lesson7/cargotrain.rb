class CargoTrain < Train

  def initialize(num)
    @num = num
    @type = "грузовой"
    validate!
    @coaches = []
    @speed = 0
  end
end
