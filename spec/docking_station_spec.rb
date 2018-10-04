require 'docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks bike' do
   bike = Bike.new
   #return the bike we dock
   expect(subject.dock(bike)).to eq bike
  end

    it { is_expected.to respond_to(:bike) }

    it 'returns docked bikes' do
   bike = Bike.new
   subject.dock(bike)
   #return the bike we just docked
   expect(subject.bike).to eq bike
 end
end
