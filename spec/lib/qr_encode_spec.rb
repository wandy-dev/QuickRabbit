RSpec.describe QuickRabbit::QrEncode do
  describe '.encode' do
    let(:directory) { './spec/tmp' }
    let(:string) { 'hello' }
    let(:file_name) { 'hello' }

    subject { QuickRabbit::QrEncode.new(string, file_name).encode }

    it 'runs the system command' do
      QuickRabbit.configure do |config|
        config.directory = directory
      end

      expect_any_instance_of(Kernel).to receive(:system).with(
        "qrencode #{string} -o #{File.expand_path(directory)}/" \
          "#{file_name}.png -s 3"
      )
      subject
    end
  end
end
