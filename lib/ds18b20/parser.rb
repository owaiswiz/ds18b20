require 'ds18b20/exceptions'
module Ds18b20
  class Parser

    ERROR_READINGS = [85000,127687]
    MAXIMUM_RETRIES = 3

    def initialize(file_location)
      @file_location = file_location
      @retries = 0
    end

    def get_temperature_celsius
      get_temperature_from_file
    end

    def get_temperature_fahrenheit
      (get_temperature_from_file * 9/5.0) + 32
    end

    def get_temperature_kelvin
      get_temperature_from_file + 273.15
    end

    alias_method :celsius, :get_temperature_celsius
    alias_method :fahrenheit, :get_temperature_fahrenheit
    alias_method :kelvin, :get_temperature_kelvin

    private
    def get_temperature_from_file
      content = read_file
      data = content.split("\n")[1].split
      raw_hex = (data[1][1] + data[0]).hex
      reading_int = data.last.split("=").last.to_i
      
      if ERROR_READINGS.include?(reading_int) || content.include?("crc=00 NO") 
        raise Ds18b20::InvalidReadingError 
      end

      if raw_hex < 2048
        # The result is positive and can be returned 
        # after dividing by 16      
        return raw_hex/16.0
      else
        # The result is negative and can be returned 
        # after taking 2's complement and dividing by 16
        return -(twos_complement(raw_hex)/16.0)
      end

    rescue Ds18b20::InvalidReadingError
      if @retries < MAXIMUM_RETRIES
        @retries += 1
        sleep 0.1
        retry
      else
        @retries = 0
        raise Ds18b20::InvalidReadingError
      end
    end

    def read_file
      file = File.read(@file_location)
      if file && file.include?("t=")
        return file
      end
      raise Ds18b20::InvalidFileSpecifiedError
    end

    def twos_complement(number)
      (number ^ ((1<<12) - 1)) + 1
    end
  end
end

