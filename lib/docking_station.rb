require 'bike.rb'

class DockingStation
DEFAULT_CAPACITY = 20
attr_reader :bikes
attr_reader :capacity

def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @bikes = []
end


  def release_bike
    raise 'No bikes available' if empty? || broken?
    @bikes.pop
  end

  def dock(bike)
    raise 'Docking station is full' if full?
    @bikes.push(bike)
  end

private

def full?
  @bikes.count >= @capacity
end

def empty?
  @bikes.empty?
end

end
