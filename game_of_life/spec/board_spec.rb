require 'board'

describe Board do
  it 'initializes with a 2x2 board' do
    empty_board = [[0, 0], [0, 0]]
    expect(subject.layout).to eq empty_board
  end

  it 'cells can be set to 1' do
    subject.alive([1,1])
    one_cell_board = [[0, 0], [0, 1]]
    expect(subject.layout).to eq one_cell_board
  end
end
