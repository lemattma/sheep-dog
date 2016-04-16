require_relative '../lib/app.rb'

describe App do
  let(:input) { File.readlines(File.expand_path('../fixtures/input', __FILE__)) }
  let(:output) { File.read(File.expand_path('../fixtures/output', __FILE__)) }
  let(:app) { described_class.new(input) }

  describe '#initialize' do
    specify 'sets instance variables' do
      expect(app.send(:paddock_size)).to eq([5, 5])
      expect(app.instance_variable_get(:@config)).to eq(input)
      expect(app.instance_variable_get(:@sheepdog)).to be_a(Sheepdog)
    end
  end

  describe '#process' do
    specify 'returns the correct output' do
      expect(app.process.join("\n")).to eq(output)
    end
  end  
end
