class PassengerCoach < Coach

  def initialize(seats)
    @type = "пассажирский"
    @seats = seats
    @busy_seats = 0
  end

  def take_seat
    @seats -= 1 if @seats > 0
    @busy_seats += 1
  end

  def free_space
    @seats
  end

  def busy_space
    @busy_seats
  end
end
