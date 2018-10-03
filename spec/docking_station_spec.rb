require 'docking_station.rb'
require 'bike.rb'

describe DockingStation do
    it { is_expected.to respond_to :release_bike}

    it 'releases working bikes' do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument}

    it 'Bike in dock is equal to the bike that was just docked' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes.last).to eq(bike)
    end

    it "raises error because empty" do
      expect {subject.release_bike }.to raise_error 'docking station empty'
    end

    it "raises error because full" do
      20.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error 'docking station full'
    end

end
