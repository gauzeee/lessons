class PassengerCoach < Coach
  attr_reader :type

  def initialize
    @type = "пассажирский"
  end
end
