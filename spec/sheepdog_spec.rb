require_relative '../lib/sheepdog.rb'

describe Sheepdog do
  let(:sheepdog) { described_class.new }

  context 'when initialized with no values' do
    it 'has a [5, 5] paddock by default' do
      expect(sheepdog.paddock.dimensions).to eq([5, 5])
    end
  end

  describe "position method" do
    it "sets a [x, y, f] array" do
      sheepdog.place 0, 0, 'N'
      expect(sheepdog.position.count).to eq(3)
    end
  end

  context "giving instructions" do
    describe 'place x, y, dir' do
      context 'no arguments given' do
        it "defaults to 0, 0, N" do
          sheepdog.place
          expect(sheepdog.position).to eq([0, 0, 'N'])
        end
      end

      it 'prevents from moving if the position will cause the sheepdog to go out of the paddock' do
        sheepdog.place(0, 0, 'N')
        sheepdog.place(0, 6, 'N')
        expect(sheepdog.position).to eq([0, 0, 'N'])
      end
    end

    describe 'move' do
      it 'move the toy sheepdog one unit forward in the direction it is currently facing' do
        sheepdog.place(0, 0, 'N')
        sheepdog.move('M')
        expect(sheepdog.position).to eq([0, 1, 'N'])
      end

      it 'prevents from moving if the next position is out of bounds' do
        sheepdog.place(0, 0, 'W')
        sheepdog.move('M')
        expect(sheepdog.position).to eq([0, 0, 'W'])
      end
    end

    describe 'turn left' do
      it 'will rotate the sheepdog 90 degrees to the left without changing the position of the sheepdog' do
        sheepdog.place(0, 0, 'N')
        sheepdog.move('L')
        expect(sheepdog.position).to eq([0, 0, 'W'])
      end
    end

    describe 'turn right' do
      it 'will rotate the sheepdog 90 degrees to the right without changing the position of the sheepdog' do
        sheepdog.place(0, 0, 'N')
        sheepdog.move('R')
        expect(sheepdog.position).to eq([0, 0, 'E'])
      end
    end
  end
end
