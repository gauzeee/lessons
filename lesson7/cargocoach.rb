class CargoCoach < Coach
  attr_reader :type

  def initialize
    @type = "грузовой"
  end
end
