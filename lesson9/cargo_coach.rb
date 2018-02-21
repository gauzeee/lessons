class CargoCoach < Coach
  def initialize(space)
    super('cargo', space)
  end

  def take_space(vol)
    super(vol)
  end
end
