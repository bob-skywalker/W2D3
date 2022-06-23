class Board
  def initialize(n)
    @grid = Array.new(n){Array.new(n, :N)}
    @size = n * n
  end

  def size
    @size
  end

  def [](position)
    row, col = position
    return @grid[row][col]
  end

  def []=(position, val)
    row, col = position
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count {|el| el == :S}
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end

  end

  def place_random_ships
    ships = @size * 0.25

    while self.num_ships < ships
      l = rand(0...@grid.length)
      w = rand(0...@grid.length)
      pos = [l, w]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    new_arr = @grid.map do |arr|
      arr.map do |el|
        if el == :S
          :N
        else
          el
        end
      end
    end
    new_arr
  end

  def self.print_grid(arr)
    arr.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
