require_relative 'keys'
require_relative 'offsets'
require_relative 'shifts'
require 'date'

class Enigma


  def encrypt(text,
              key_num = Keys.random_number,
              date = Offsets.current_date)
    @hash = { encryption: '',
              key: key_num,
              date: date }
    cipher(text.downcase)
  end

  def decrypt(text, key_num, date = Offsets.current_date)
    @hash = { decryption: '',
              key: key_num,
              date: date }
    cipher(text)
  end

  def crack(text, date = Offsets.current_date)
    loop do
      current = decrypt(text, Keys.random_number, date)
      if current[:decryption][-4..] == ' end'
        return current
        break
      end
    end
  end
  def characters
    ('a'..'z').to_a << ' '
  end

  def make_shifts(key_num, date)
    key = Keys.new(key_num)
    offset = Offsets.new(date)
    Shift.new(key, offset)
  end

  def cipher(text)
    text.each_char.with_index do |char, index|
      char = update_char(char, index) if characters.index(char)
      @hash[@hash.keys[0]] << char
    end
    @hash
  end

  def update_char(char, index)
    rotated_characters = shift(index)
    rotated_characters[characters.index(char)]
  end

  def shift(index)
    shift = make_shifts(@hash[:key], @hash[:date])
    shift = if @hash[:encryption]
              shift.mirror_shift(index)
            else
              -shift.mirror_shift(index)
            end
    characters.rotate(shift)
  end
end
