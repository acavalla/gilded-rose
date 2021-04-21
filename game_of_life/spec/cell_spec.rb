require './lib/cell'

describe Cell do
  it 'initializes as dead' do
    expect(subject).not_to be_alive
  end

  it 'can come alive' do
    subject.spawn
    expect(subject).to be_alive
  end
end
