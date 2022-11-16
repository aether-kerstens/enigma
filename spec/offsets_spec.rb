require 'date'
require './lib/enigma'
require './lib/offsets'

RSpec.describe Offsets do
  before(:each) do
    @offset = Offsets.new('150199')
  end

  it 'exists' do
    expect(@offset).to be_an_instance_of(Offsets)
  end

  it 'has a date' do
    expect(@offset.date).to eq('150199')
  end

  it 'has an offsets array' do
    expect(@offset.offsets).to eq('9601')
  end

  it 'has an integer for a offset' do
    expect(@offset.a_offset).to eq(9)
  end

  it 'has an integer for b offset' do
    expect(@offset.b_offset).to eq(6)
  end

  it 'has an integer for c offset' do
    expect(@offset.c_offset).to eq(0)
  end

  it 'has an integer for d offset' do
    expect(@offset.d_offset).to eq(1)
  end
end
