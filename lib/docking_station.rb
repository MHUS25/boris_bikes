class DockingStation
  attr_reader :bike

  def release_bike
    fail 'docking station empty' unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
  end
end
