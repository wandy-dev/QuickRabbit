require 'quick_rabbit/configuration'
require 'quick_rabbit/version'
require 'quick_rabbit/qr_encode'

module QuickRabbit
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def encode(data:, file_name:)
      QuickRabbit::QrEncode.new(data, file_name).encode
    end
  end
end
