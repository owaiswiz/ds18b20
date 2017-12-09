require 'ds18b20/parser'
require 'spec_helper'
RSpec.describe Ds18b20::Parser do

  let(:valid_sample_positive_24_187C) { described_class.new support_file_location("valid_sample_positive_24_187C") }
  let(:valid_sample_negative_10_125C) { described_class.new support_file_location("valid_sample_negative_10_125C") }
  let(:invalid_sample_1)              { described_class.new support_file_location("invalid_sample_1") }
  let(:invalid_reading_sample_1)              { described_class.new support_file_location("invalid_reading_sample_1") }
  let(:invalid_reading_sample_2)              { described_class.new support_file_location("invalid_reading_sample_2") }

  context "there is a valid file with a positive temperature" do
    describe ".get_temperature_celsius" do
      it "returns the correct temperature" do
        expect(valid_sample_positive_24_187C.get_temperature_celsius).to eq(24.1875)
      end
    end

    describe ".get_temperature_fahrenheit" do
      it "returns the correct temperature" do
        expect(valid_sample_positive_24_187C.get_temperature_fahrenheit).to eq(75.5375)
      end
    end
    
    describe ".get_temperature_kelvin" do
      it "returns the correct temperature" do
        expect(valid_sample_positive_24_187C.get_temperature_kelvin).to eq(297.3375)
      end
    end
  end

  context "there is a valid file with a negative temperature" do
    describe ".get_temperature_celsius" do
      it "returns the correct temperature" do
        expect(valid_sample_negative_10_125C.get_temperature_celsius).to eq(-10.125)
      end
    end

    describe ".get_temperature_fahrenheit" do
      it "returns the correct temperature" do
        expect(valid_sample_negative_10_125C.get_temperature_fahrenheit.round(3)).to eq(13.775)
      end
    end
    
    describe ".get_temperature_kelvin" do
      it "returns the correct temperature" do 
        expect(valid_sample_negative_10_125C.get_temperature_kelvin).to eq(263.025)
      end
    end
  end

  context "there is an invalid file" do
    describe ".get_temperature_celsius" do
      it "raises an invalid file error" do
        expect { invalid_sample_1.get_temperature_celsius }.to raise_error Ds18b20::InvalidFileSpecifiedError
        expect { invalid_reading_sample_1.get_temperature_celsius }.to raise_error Ds18b20::InvalidReadingError
        expect { invalid_reading_sample_2.get_temperature_celsius }.to raise_error Ds18b20::InvalidReadingError
      end
    end
    
    describe ".get_temperature_fahrenheit" do
      it "raises an invalid file error" do
        expect { invalid_sample_1.get_temperature_fahrenheit }.to raise_error Ds18b20::InvalidFileSpecifiedError
        expect { invalid_reading_sample_1.get_temperature_fahrenheit }.to raise_error Ds18b20::InvalidReadingError
        expect { invalid_reading_sample_2.get_temperature_fahrenheit }.to raise_error Ds18b20::InvalidReadingError
      end
    end
    
    describe ".get_temperature_kelvin" do
      it "raises an invalid file error" do
        expect { invalid_sample_1.get_temperature_kelvin }.to raise_error Ds18b20::InvalidFileSpecifiedError
        expect { invalid_reading_sample_1.get_temperature_kelvin }.to raise_error Ds18b20::InvalidReadingError
        expect { invalid_reading_sample_2.get_temperature_kelvin }.to raise_error Ds18b20::InvalidReadingError
      end
    end
  end
end
