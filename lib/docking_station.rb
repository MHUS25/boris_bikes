require 'bike.rb'

class DockingStation
DEFAULT_CAPACITY = 20
attr_reader :bikes
attr_reader :capacity

def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @bikes = []
  @broken_bikes = []
end


  def release_bike
    raise 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'Docking station is full' if full?
    if bike.broken?
      @broken_bikes.push(bike)
    else
      @bikes.push(bike)
    end
  end

private

def full?
  @bikes.count >= @capacity
end

def empty?
  @bikes.empty?
end

end
