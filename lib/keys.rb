class Keys
  attr_reader :a_key, :b_key, :c_key, :d_key

  def initialize(num)
    @a_key = num[0..1].to_i
    @b_key = num[1..2].to_i
    @c_key = num[2..3].to_i
    @d_key = num[3..4].to_i
    [@a_key, @b_key, @c_key, @d_key]
  end

  def self.random_number
    num = rand(00000..99999).to_s.rjust(5, "0")
  end
end
