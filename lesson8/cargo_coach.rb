class CargoCoach < Coach

  def initialize(capacity)
    @type = "грузовой"
    @capacity = capacity
    @busy_capacity = 0
  end

  def take_capacity(vol)
    @capacity -= vol if @capacity >= vol
    @busy_capacity += vol
  end

  def free_space
    @capacity
  end

  def busy_space
    @busy_capacity
  end
end
