require 'board'

describe Board do
  it 'initializes with a 2x2 board' do
    empty_board = [[0, 0], [0, 0]]
    expect(subject.layout).to eq empty_board
  end
end
