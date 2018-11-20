require 'ostruct'

RSpec.describe QuickRabbit do
  after(:each) do
    QuickRabbit.configure do |config|
      config.directory = nil
      config.img_size = nil
    end
  end

  it "has a version number" do
    expect(QuickRabbit::VERSION).not_to be nil
  end

  describe '.configure' do
    let(:directory) { './spec/tmp' }
    let(:img_size) { '3' }

    subject { QuickRabbit.configuration }

    it 'saves config variables' do
      expect(QuickRabbit.configuration.directory).to be_nil
      expect(QuickRabbit.configuration.img_size).to be_nil

      QuickRabbit.configure do |config|
        config.directory = directory
        config.img_size = img_size
      end

      expect(QuickRabbit.configuration.directory).to eq(directory)
      expect(QuickRabbit.configuration.img_size).to eq(img_size)
    end
  end

  describe '.encode' do
    context 'all requirements met' do
      let(:directory) { './spec/tmp' }
      let(:img_size) { '3' }
      let(:data) { 'hello' }
      let(:file_name) { 'hello' }

      subject { QuickRabbit.encode(data: data, file_name: file_name) }

      it 'initalizes the encoder' do
        QuickRabbit.configure do |config|
          config.directory = directory
          config.img_size = img_size
        end

        expect(QuickRabbit::QrEncode).to receive(:new).with(
          data, file_name
        ).and_return(OpenStruct.new)
        expect_any_instance_of(OpenStruct).to receive(:encode)
        subject
      end
    end
  end
end
