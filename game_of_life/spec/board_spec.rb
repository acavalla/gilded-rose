require 'board'

describe Board do
  empty_board = [[0, 0], [0, 0]]
  it 'initializes with a 2x2 board' do
    expect(subject.layout).to eq empty_board
  end
  describe '.alive' do
    it 'cells can be set to 1' do
      subject.alive([1,1])
      one_cell_board = [[0, 0], [0, 1]]
      expect(subject.layout).to eq one_cell_board
    end
  end

  describe '.dead' do
    it 'cells can be set back to 0' do
      subject.alive([1,1])
      subject.dead([1,1])
      expect(subject.layout).to eq empty_board
    end
  end

  describe '.tick' do
    it 'updates layout' do
      expect(subject.tick).to eq subject.layout
    end
  end

  describe '.neighbours' do
    it 'tallies living neighbours' do
      subject.alive([1,1])
      subject.neighbours
      expect(subject.neighbs).to eq [[0, 1], [1, 0]]
    end
  end


end
