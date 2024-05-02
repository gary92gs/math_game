require "./player"
require "./question"

class Game 
  attr_accessor :turn, :turn_player, :winner, :question
  attr_reader :player1, :player2
  def initialize
    @turn = 1
    @turn_player = 1
    @winner = nil
    @player1 = Player.new
    @player2 = Player.new
    @question = Question.new
    game_loop() # starts game loop
  end

  def game_loop
    while !self.winner

      print_turn
      generate_new_question
      print_question
      player_answer = get_user_input.to_i
      print_answer_evaluation(player_answer)
      change_turn

      if player1.num_lives == 0
        self.winner = 2
      end
      if player2.num_lives == 0
        self.winner = 1
      end

    end
    print_winner
  end

  def print_turn
    puts ""
    puts "----- TURN #{self.turn} -----"
    puts "P1: #{self.player1.num_lives}/3 vs P2: #{self.player2.num_lives}/3"
  end

  def print_question
    puts "Player #{self.turn_player}: What does #{self.question.num1} + #{self.question.num2} equal?"
  end

  def print_winner
    puts "Player #{self.winner} wins!"
  end

  def print_answer_evaluation(player_answer)
    if player_answer == self.question.answer
      puts "YES! You are correct"
    else
      puts "Seriously? No!"
      self.turn_player == 1 ? player1.minus_life : player2.minus_life
    end
  end

  def generate_new_question
    self.question = Question.new
  end

  def get_user_input
    gets.chomp
  end

  def change_turn
    self.turn += 1
    self.turn_player = self.turn % 2 == 0 ? 2 : 1
  end

end