class CargoTrain < Train

  def initialize(num)
    @type = "грузовой"
    super(num, type)
  end
end
