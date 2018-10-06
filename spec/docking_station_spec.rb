require 'docking_station.rb'
require 'bike.rb'



describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it "releases working bikes" do
      bike = double :bike, working?: true, report_broken: true
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
    end

    it 'raises an error when the only bikes available are broken' do
      docking_station = DockingStation.new
      bike = double :bike, working?: true, report_broken: true
      bike.report_broken
      docking_station.dock(bike)
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when there are no bikes' do
      docking_station = DockingStation.new
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    describe '#dock' do
      it 'raises an error when docking station is full' do
        bike = double :bike, working?: true, report_broken: true
        subject.capacity.times {subject.dock(bike)}
        expect { subject.dock(bike) }.to raise_error "Docking station is full"
     end
    end

    it { is_expected.to respond_to(:bikes) }

    it 'returns docked bike' do
       bike = double :bike, working?: true, report_broken: true
       subject.dock(bike)
       #return the bike we just docked
       expect(subject.bikes.last || subject.broken_bikes.last).to eq bike
    end

    describe '#capcity' do
      it 'returns default capacity when DockingStation.new is called' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    describe 'initialization' do
      it 'has a variable capacity' do
        bike = double :bike, working?: true, report_broken: true
        docking_station = DockingStation.new(50)
        50.times { docking_station.dock bike }
        expect{ docking_station.dock bike }.to raise_error 'Docking station is full'
      end
    end
end
