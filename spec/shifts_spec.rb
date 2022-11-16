require './lib/shifts'
require './lib/keys'
require './lib/offsets'

RSpec.describe Shift do
  before(:each) do
    @key = Keys.new("06050")
    @offset = Offsets.new('150199')
    @shift = Shift.new(@key, @offset)
  end

  it 'exists' do
    expect(@shift).to be_an_instance_of(Shift)
  end

  it 'can calculate a shift' do
    expect(@shift.a_shift).to eq(15)
  end

  it 'can calculate b shift' do
    expect(@shift.b_shift).to eq(66)
  end

  it 'can calculate c shift' do
    expect(@shift.c_shift).to eq(5)
  end

  it 'can calculate d shift' do
    expect(@shift.d_shift).to eq(51)
  end
end
