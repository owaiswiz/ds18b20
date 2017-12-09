module Ds18b20
  class InvalidReadingError < StandardError
    def initialize
      super("An error occurred while reading the temperature.\nPlease make sure that the DS18B20 sensor is properly installed and you've specified the correct file.")
    end
  end

  class InvalidFileSpecifiedError < StandardError
    def initialize
      super("An error occured while trying to read the file. Either the file you specified is not correct or the data in the file is not the one that is being expected by this program.\nPlease make sure that the file you specified has the data in a similar manner as this file: https://github.com/owaiswiz/ds18b20/blob/master/spec/support/valid_sample_positive_24_187C")
    end
  end
end
