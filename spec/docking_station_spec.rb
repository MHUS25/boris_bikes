require 'docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to :release_bike}

    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument}

    it 'Bike in dock is equal to the bike that was just docked' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq(bike)
    end
end
