class PassengerTrain < Train
  include Validation

  validate :num, :presence
  validate :num, :format, TRAIN_NUMBER

  def initialize(num)
    super(num, 'passenger')
  end
end
