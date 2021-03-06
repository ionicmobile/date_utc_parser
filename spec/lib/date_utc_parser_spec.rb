require_relative '../../lib/date_utc_parser'
require 'time'
require 'active_support/core_ext/numeric/time'
require 'active_support/core_ext/time/calculations'

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
    let(:date2) { "2012-07-04 00:35:36 UTC" }

    it 'returns the parsed date' do
      described_class.parse(date).should == Time.parse(date)
      described_class.parse(date2).should == Time.parse(date2)
    end
  end

  context "when the date is already a Time object" do
    context 'and is a utc date' do
      let(:date) { Time.now.utc }

      it "returns the utc time object" do
        subject.should == date
      end
    end

    context 'and is a utc time with zone object' do
      let(:date) { Time.now }

      before do
        Time.zone = 'UTC'
      end

      it 'converts it to a standard utc time object' do
        subject.should_not be_a(ActiveSupport::TimeWithZone)
        subject.should be_utc
      end
    end

    context 'but is not a utc date' do
      let(:date) { Time.now }

      it "returns the time object as utc" do
        subject.should == date.utc
      end
    end
  end
end
