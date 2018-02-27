class PassengerCoach < Coach
  def initialize(space)
    super('passenger', space)
  end

  def take_space
    super(1)
  end
end
