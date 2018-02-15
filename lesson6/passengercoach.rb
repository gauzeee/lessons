class PassengerCoach < Coach
  attr_reader :type

  def initialize
    @type = "Passenger"
  end
end
