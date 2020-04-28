class Player
  attr_accessor :lives, :turn
  attr_reader :id

  def initialize(id, turn)
    @lives = 3
    @turn = turn
    @id = id
  end
end