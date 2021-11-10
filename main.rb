class Question
  attr_accessor :number1, :number2, :solution
  def initialize
    @number1 = rand(1..100)
    @number2 = rand(1..100)
    @solution = @number1 + @number2
  end
end

class Player
  attr_accessor :name, :life
  def initialize(name)
    @name = name
    @life = 7 #initial lives
  end
end

class Game
  def initialize
    @current_player
    @player1
    @player2
  end

  # NEW GAME
  def start_game
    puts "-----------------------"
    puts "aRuby Made Math Game!"
    puts "-----------------------"
    puts "\n each players has #{player1.life} lives, first to 0 looses\n"
    puts "Player Name:"
    @player1 = Player.new(gets.chomp)

    puts "Opponent Name:"
    @player2 = Player.new(gets.chomp)

    puts "Alright! Let's begin!"
    puts "\n"
    @current_player = @player1

    play while (@player1.life > 0 && @player2.life > 0)
    end_game
  end

  # PLAYERS ROTATION
  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  
  # QUESTIONS
  def play
    question = Question.new
    puts "\n-----------------------\n"
    puts "Question for #{@current_player.name}:"
    puts "What does #{question.number1} + #{question.number2} equal?"
    answer = gets.chomp.to_i

    if answer == question.solution
      puts "\n pass #{answer} is right you bloody genius" #come back to add an array of compliments
    else
      puts "\n #{answer}  --- shoulda been #{question.solution} \n"
      @current_player.life -= 1
    end
  
    puts "SCORE: #{@player1.name} - #{@player1.life} VS #{@player2.name} - #{@player2.life}"

    switch_player
  end

  # GAME ENDING
  def end_game
    puts "-----------------------"
    puts "#{@current_player.name} Wins"
    puts "ENTER '1' TO PLAY AGAIN"
    if (gets.chomp == '1')
      start_game
    else
      puts "-----------------------"
    end
  end
end

new_game = Game.new
new_game.start_game 