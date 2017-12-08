require 'ds18b20/parser'
require 'spec_helper'
RSpec.describe Ds18b20::Parser do

  let(:valid_sample_positive_24_187C) { described_class.new support_file_location("valid_sample_positive_24_187C") }
  let(:valid_sample_negative_11_440C) { described_class.new support_file_location("valid_sample_negative_11_440C") }
  let(:invalid_sample_1)              { described_class.new support_file_location("invalid_sample_1") }
  let(:invalid_sample_2)              { described_class.new support_file_location("invalid_sample_2") }
    
  context "there is a valid file with a positive temperature" do
    describe ".get_temperature_celsius" do
      it "returns the correct temperature" do
        expect(valid_sample_positive_24_187C.get_temperature_celsius).to equal(24.187)
      end
    end

    describe ".get_temperature_fahrenheit" do
      it "returns the correct temperature" do
        expect(valid_sample_positive_24_187C.get_temperature_fahrenheit).to equal(75.536)
      end
    end
    
    describe ".get_temperature_kelvin" do
      it "returns the correct temperature" do
        expect(valid_sample_positive_24_187C.get_temperature_kelvin).to equal(297.337)
      end
    end
  end

  context "there is a valid file with a negative temperature" do
    describe ".get_temperature_celsius" do
      it "returns the correct temperature" do
        expect(valid_sample_negative_11_440C.get_temperature_celsius).to equal(-11.440)
      end
    end

    describe ".get_temperature_fahrenheit" do
      it "returns the correct temperature" do
        expect(valid_sample_negative_11_440C.get_temperature_fahrenheit).to equal(11.408)
      end
    end
    
    describe ".get_temperature_kelvin" do
      it "returns the correct temperature" do 
        expect(valid_sample_negative_11_440C.get_temperature_kelvin).to equal(261.71)
      end
    end
  end
end
