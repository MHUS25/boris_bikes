require 'docking_station.rb'
require 'bike.rb'


describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    # it 'releases working bikes' do
    #   bike = subject.release_bike
    #   expect(bike).to be_working
    # end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bikes) }

    it 'returns docked bike' do
      bike = Bike.new
      subject.dock(bike)
      #return the bike we just docked
      expect(subject.bikes.last).to eq bike
    end

    describe '#release_bikes_bike' do
      it 'raises an error when there are no bikes' do
        docking_station = DockingStation.new
        expect { subject.release_bike }.to raise_error "No bikes available"
      end
    end

    describe '#dock' do
      it 'raises an error when docking station is full' do
        DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
        expect { subject.dock(Bike.new) }.to raise_error "Docking station is full"
     end
    end

    describe '#capcity' do
      it 'returns default capacity when DockingStation.new is called' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    describe 'initialization' do
      it 'has a variable capacity' do
        docking_station = DockingStation.new(50)
        50.times { docking_station.dock Bike.new }
        expect{ docking_station.dock Bike.new }.to raise_error 'Docking station is full'
      end
    end

      it 'raises an error when the only bikes available are broken' do
        docking_station = DockingStation.new
        bike = Bike.new
        bike.report_broken
        docking_station.dock(bike)
        expect { subject.release_bike }.to raise_error "No bikes available"
      end

end
