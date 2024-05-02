class Player 

  attr_accessor :num_lives
  def initialize
    @num_lives = 3
  end

  def minus_life
    self.num_lives -= 1
  end
end