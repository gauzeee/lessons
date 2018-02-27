class Coach
  attr_reader :type, :busy_space

  include CompanyName

  def initialize(type, space)
    @type = type
    @space = space
    @busy_space = 0
  end

  def take_space(vol)
    @busy_space += vol if vol <= free_space
  end

  def free_space
    @space - @busy_space
  end
end
