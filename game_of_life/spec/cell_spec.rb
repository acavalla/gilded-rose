require './lib/cell'

describe Cell do
  it 'can be alive' do
    expect(subject).not_to be_alive
  end
end
