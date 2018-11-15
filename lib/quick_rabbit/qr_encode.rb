module QuickRabbit
  class QrEncode
    attr_accessor :string, :file_name

    def initialize(string, file_name)
      @string    = string
      @file_name = file_name
    end

    def encode
      system(command)
    end

    private

    def command
      "qrencode #{string} -o #{file_name_flag} #{img_size_flag}"
    end

    def file_name_flag
      File.expand_path(
        "#{QuickRabbit.configuration.directory}/#{file_name}.png"
      )
    end

    def img_size_flag
      "-s #{QuickRabbit.configuration.img_size || 3}"
    end
  end
end
