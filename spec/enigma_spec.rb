require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'can encrypt' do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
  end

  it 'can decrypt' do
    enigma = Enigma.new
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
  end

  # encrypt a message with a key (uses today's date)
  encrypted = enigma.encrypt("hello world", "02715")
  #=> # encryption hash here

  #decrypt a message with a key (uses today's date)
  pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
  #=> # decryption hash here

  # encrypt a message (generates random key and uses today's date)
  enigma.encrypt("hello world")
  #=> # encryption hash here

end
