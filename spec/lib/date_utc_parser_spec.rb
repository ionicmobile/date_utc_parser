require_relative '../../lib/date_utc_parser'
require 'time'

describe DateUtcParser, "Parsing:" do
  subject { described_class.parse(date) }

  context "when there is no date given" do
    let(:date) { nil }

    it 'returns nil' do
      subject.should be_nil
    end
  end

  context "when the date is a string, is a valid date time format, but is not utc" do
    let(:date) { "2012-05-14 10:49:38 -0500" }

    it 'returns nil' do
      subject.should be_nil
    end
  end

  context "when the date is a string, is a valid format, but is not a valid date" do
    let(:date) { "2012-50-12T20:46:51Z" }

    it 'returns nil' do
      subject.should be_nil
    end
  end

  context "when the date is a string, but is not a valid date time format" do
    let(:date) { "asdf" }

    it 'returns nil' do
      subject.should be_nil
    end
  end

  context "when the date is a valid date time format, and is a valid date, and is utc" do 
    let(:date) { "2012-05-12T20:46:51Z" }

    it 'returns the parsed date' do
      subject.should == Time.parse(date)
    end
  end

  context "when the date is already a Time object" do
    context 'and is a utc date' do
      let(:date) { Time.now.utc }

      it "returns the time object" do
        subject.should == date
      end
    end

    context 'but is not a utc date' do
      let(:date) { Time.now }

      it "returns the time object as utc" do
        subject.utc?.should be_true
        subject.should == date.utc
      end
    end
  end
end
