require_relative "../lib/paddock.rb"

describe Paddock do
  let(:paddock) { Paddock.new }

  context 'when initialized with no values' do
    it "has a [5,5] size by default" do
      expect(paddock.dimensions).to eq [5,5]
    end
  end

  describe "position method" do
    context 'when coordinates are given' do
      it "changes current position and returns new position" do
        expect(paddock.position([3,3])).to eq [3,3]
      end
    end

    context 'when no coordinates are given' do
      it "returns current position" do
        paddock.position [2,2,'N']
        expect(paddock.position).to eq [2,2,'N']
      end
    end

    context 'when out-of-bounds coordinates are given' do
      it "ignores and return current position" do
        paddock.position [2,2,'N']
        expect(paddock.position([2,100,'N'])).to eq [2,2,'N']
      end
    end
  end

  describe 'out_of_bounds? method' do
    context 'when allowed coordinates are given' do
      it "returns true" do
        expect(paddock.out_of_bounds?([0,0])).to eq false
      end
    end

    context 'when out-of-bounds coordinates are given' do
      it "returns false" do
        expect(paddock.out_of_bounds?([10,0])).to eq true
      end
    end
  end
end