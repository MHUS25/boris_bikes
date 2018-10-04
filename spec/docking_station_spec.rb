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
end
