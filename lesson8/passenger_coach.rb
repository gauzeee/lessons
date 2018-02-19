class PassengerCoach < Coach

  def initialize(space)
    super("пассажирский", space)
  end

  def take_space
    super(1)
  end
end
