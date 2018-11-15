module QuickRabbit
  class Configuration
    attr_accessor :directory, :img_size

    def initialize
      @directory = ENV['DIRECTORY']
      @img_size  = ENV['IMG_SIZE']
    end
  end
end
