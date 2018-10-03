class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = Array.new
  end

  def release_bike
    fail 'docking station empty' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'docking station full' if @bikes.count >= 20
    @bikes << bike
  end
end
