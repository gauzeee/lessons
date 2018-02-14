class CargoTrain < Train

  def initialize(num)
    @num = num
    @type = "Cargo"
    @coaches = []
    @speed = 0
  end
end
