class PassengerTrain < Train

  def initialize(num)
    @type = "пассажирский"
    super(num, type)
  end
end
