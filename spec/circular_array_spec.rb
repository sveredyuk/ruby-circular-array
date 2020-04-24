# frozen_string_literal: true

RSpec.describe CircularArray do
  it 'has a version number' do
    expect(CircularArray::VERSION).not_to be nil
  end

  describe '#[]' do
    context 'simple case' do
      let(:circular_array) { CircularArray[:a, :b, :c] }

      it 'behaives like array' do
        expect(circular_array).to be_kind_of Array

        expect(circular_array[-3]).to eq :a
        expect(circular_array[-2]).to eq :b
        expect(circular_array[-1]).to eq :c
        expect(circular_array[0]).to eq :a
        expect(circular_array[1]).to eq :b
        expect(circular_array[2]).to eq :c
      end

      it 'endless' do
        expect(circular_array[-7]).to eq :c
        expect(circular_array[-6]).to eq :a
        expect(circular_array[-5]).to eq :b
        expect(circular_array[-4]).to eq :c
        # for indexes -3..2, see test above
        expect(circular_array[3]).to eq :a
        expect(circular_array[4]).to eq :b
        expect(circular_array[5]).to eq :c
        expect(circular_array[6]).to eq :a
        expect(circular_array[7]).to eq :b
        expect(circular_array[8]).to eq :c
        expect(circular_array[9]).to eq :a
        expect(circular_array[10]).to eq :b
        expect(circular_array[11]).to eq :c
        expect(circular_array[12]).to eq :a
        expect(circular_array[13]).to eq :b
        expect(circular_array[14]).to eq :c
        expect(circular_array[15]).to eq :a
        expect(circular_array[16]).to eq :b
        expect(circular_array[17]).to eq :c
        expect(circular_array[18]).to eq :a
      end

      it 'no recursion' do
        # this will detect accidentally introduced recursion
        allow(circular_array).to receive(:[]).and_call_original
        expect(circular_array).to receive(:[]).exactly(2).times
        expect(circular_array[1]).to eq :b
        expect(circular_array[10]).to eq :b
      end
    end

    context 'empty' do
      let(:circular_array) { CircularArray.new([]) }

      it 'returns nil' do
        expect(circular_array[0]).to eq nil
      end
    end
  end
end
