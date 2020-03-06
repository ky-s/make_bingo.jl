# ruby 2.6.3
class Bingo
  NUMBERS_ARR = [
     1..14, # B
    15..29, # I
    30..44, # N
    45..59, # G
    60..74, # O
  ]

  def self.make
    NUMBERS_ARR.
      map { |numbers| numbers.to_a.shuffle[0..4] }.
      tap { |cols| cols[2][2] = nil }. # center blank
      transpose.
      then { |rows| self.new(rows) }
  end

  def initialize(rows)
    @rows = rows
  end

  def to_s
    ([%w(B I N G O)] + @rows).map { |row|
      row.map { |cell| cell.to_s.rjust(2) }.join(" | ")
    }.join("\n")
  end
end

puts Bingo.make
