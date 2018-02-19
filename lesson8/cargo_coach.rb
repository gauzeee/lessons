class CargoCoach < Coach

  def initialize(space)
    super("грузовой", space)
  end

  def take_space(vol)
    super(vol)
  end
end
