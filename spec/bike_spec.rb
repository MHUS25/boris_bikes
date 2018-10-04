require 'bike.rb'


describe Bike do
      it { is_expected.to respond_to :working?}

      describe "#report_broken" do
      it "can report the broken bikes" do
        subject.report_broken
        expect(subject).to be_broken
      end
      end
  end
