require 'board'

describe Board do
  it 'is 2x2' do
    expect(subject.rows).to eq 2
    expect(subject.columns).to eq 2
  end

  it 'makes a board' do
    empty_board = [[0, 0], [0, 0]]
    expect(subject.layout).to eq empty_board
  end
end
