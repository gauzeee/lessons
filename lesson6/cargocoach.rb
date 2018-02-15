class CargoCoach < Coach
  attr_reader :type

  def initialize
    @type = "Cargo"
  end
end
