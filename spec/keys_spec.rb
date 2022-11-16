require './lib/keys'

RSpec.describe Keys do
  before(:each) do
    @keys = Keys.new('06050')
  end

  it 'exists' do
    expect(@keys).to be_an_instance_of(Keys)
  end

  it 'a_key is a num' do
    expect(@keys.a_key).to eq(06)
  end

  it 'b_key is a num' do
    expect(@keys.b_key).to eq(60)
  end

  it 'c_key is a num' do
    expect(@keys.c_key).to eq(05)
  end

  it 'a_key is a num' do
    expect(@keys.d_key).to eq(50)
  end

end
