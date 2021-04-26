# frozen_string_literal: true

require 'board'

describe Board do
  empty_2_board = [[0, 0], [0, 0]]
  empty_3_board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  it 'initializes with a 2x2 board' do
    expect(subject.layout).to eq empty_2_board
  end

  it 'can be specified differently' do
    subject = described_class.new(3)
    expect(subject.layout).to eq empty_3_board
  end

  describe '.alive' do
    it 'cells can be set to 1' do
      subject.alive([1, 1])
      one_cell_board = [[0, 0], [0, 1]]
      expect(subject.layout).to eq one_cell_board
    end
  end

  describe '.dead' do
    it 'cells can be set back to 0' do
      subject.alive([1, 1])
      subject.dead([1, 1])
      expect(subject.layout).to eq empty_2_board
    end
  end

  describe '.tick' do
    before do
      subject.alive([0, 1])
    end

    it 'live cells with no live neighbours die' do
      subject.tick
      expect(subject.layout).to eq [[0, 0], [0, 0]]
    end

    it 'live cells with one live neighbour die' do
      subject.alive([0, 0])
      subject.tick
      expect(subject.layout).to eq [[0, 0], [0, 0]]
    end

    it 'cells with 2 neighbours live; dead cells with 3 neighbours are born' do
      subject.alive([0, 0])
      subject.alive([1, 0])
      subject.tick
      expect(subject.layout).to eq [[1, 1], [1, 1]]
    end

    it 'kills cells with 4 neighbours' do
      subject = described_class.new(3)
      subject.alive([0, 1])
      subject.alive([1, 0])
      subject.alive([1, 1])
      subject.alive([1, 2])
      subject.alive([2, 1])
      subject.tick
      expect(subject.layout).to eq [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
    end
  end

  describe '.neighbours' do
    it 'tallies living neighbours' do
      subject.alive([1, 1])
      subject.neighbours
      expect(subject.neighb_tally).to eq [[1, 1], [1, 0]]
    end
  end
end
