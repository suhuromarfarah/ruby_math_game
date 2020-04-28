class Game
  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new(1, true)
    @player2 = Player.new(2, false)
  end

  def play_game
    while (@player1.lives > 0 || @player2.lives > 0) do
      question = Questions.new()
      if @player1.turn
        puts "Player #{@player1.id}: What does #{question.num1} plus #{question.num2} equal?"
        if question.correct?
          puts "YES! You are correct."
        else
          puts "Seriously? No!"
          @player1.lives -= 1
        end

        @player1.turn = false
        @player2.turn = true

      elsif @player2.turn
        puts "Player #{@player2.id}: What does #{question.num1} plus #{question.num2} equal?"
        if question.correct?
          puts "YES! You are correct."
        else
          puts "Seriously? No!"
          @player2.lives -= 1
        end

        @player1.turn = true
        @player2.turn = false
      end

      if @player1.lives == 0
        puts "Player #{@player2.id} wins with a score of #{@player2.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        exit
      elsif @player2.lives == 0
        puts "Player #{@player1.id} wins with a score of #{@player1.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        exit
      else
        puts "P#{@player1.id}: #{@player1.lives}/3 vs P#{@player2.id}: #{@player2.lives}/3"
        puts "----- NEW TURN -----"
      end
    end
  end
end