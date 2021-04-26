# frozen_string_literal: true

require 'board'

describe Board do
  describe '.alive' do
    it 'saves live cells in an array' do
      subject.alive([1, 1])
      expect(subject.live).to include [1, 1]
    end
  end

  describe '.dead' do
    it 'removes cells from live array' do
      subject.alive([1, 1])
      subject.dead([1, 1])
      expect(subject.live).not_to include [1, 1]
    end
  end

  describe '.neighbours' do
    it 'tallies living neighbours' do
      subject.alive([1, 1])
      subject.count_neighbours
      neighbs = [{ location: [0, 0], tally: 1, status: 0 },
                 { location: [0, 1], tally: 1, status: 0 },
                 { location: [0, 2], tally: 1, status: 0 },
                 { location: [1, 0], tally: 1, status: 0 },
                 { location: [1, 2], tally: 1, status: 0 },
                 { location: [2, 0], tally: 1, status: 0 },
                 { location: [2, 1], tally: 1, status: 0 },
                 { location: [2, 2], tally: 1, status: 0 }]
      expect(subject.neighb_tally).to eq neighbs
    end
  end

  describe '.tick' do
    before do
      subject.alive([0, 1])
    end

    it 'live cells with no live neighbours die' do
      subject.tick
      expect(subject.live).to eq []
    end

    it 'live cells with one live neighbour die' do
      subject.alive([1, 0])
      subject.tick
      expect(subject.live).to eq []
    end

    it 'cells with 2 neighbours live; dead cells with 3 neighbours are born' do
      subject.alive([0, 0])
      subject.alive([1, 0])
      subject.tick
      expect(subject.live.length).to eq 4
    end

    it 'kills cells with 4 neighbours' do
      subject.alive([1, 0])
      subject.alive([1, 1])
      subject.alive([1, 2])
      subject.alive([2, 1])
      subject.tick
      expect(subject.live).not_to include [1, 1]
    end

    it 'resets correctly' do
      triple = [[-2, 0], [-2, 1],[-2, 2],
                [0, -2], [0, 4], [1, -2],
                [1, 4], [2, -2], [2, 4],
                [4, 0], [4, 1], [4, 2]]
      subject.alive([1, 0])
      subject.alive([1, 1])
      subject.alive([1, 2])
      subject.alive([2, 1])
      6.times { subject.tick }
      expect(subject.live).to match_array(triple)
    end
  end
end
