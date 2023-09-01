class Game
  CONDITIONS = {
    "Rock" => ["Scissors", "Lizard"],
    "Lizard" => ["Spock", "Paper"],
    "Spock" => ["Scissors", "Rock"],
    "Paper" => ["Rock", "Spock"],
    "Scissors" => ["Paper", "Lizard"]
  }

  def initialize
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock"
    puts "Please enter your name: "
    @player_name = gets.chomp
    puts "Hello #{@player_name}"

    @round_count = 0
    @player_score = 0
    @computer_score = 0

    start_game
  end

  def start_game
    until @round_count == 3
      puts "Please choose one and type it below: rock, paper, scissors, lizard, or spock"
      player_choice = gets.chomp.capitalize

      until CONDITIONS.key?(player_choice)
        puts "Invalid input! Please enter a valid option: rock, paper, scissors, lizard, or spock"
        player_choice = gets.chomp.capitalize
      end

      puts "Your choice: #{player_choice}"

      computer_choice = ["Rock", "Paper", "Scissors", "Lizard", "Spock"].sample
      puts "Computer choice: #{computer_choice}"

      if CONDITIONS[player_choice].include?(computer_choice)
        puts "You won this round!"
        @player_score += 1
      elsif computer_choice == player_choice
        puts "It's a draw!"
      else
        puts "You lost this round!"
        @computer_score += 1
      end

      @round_count += 1
    end

    show_game_result
    play_again?
  end

  def show_game_result
    if @player_score > @computer_score
      puts "Congratulations #{@player_name}. You have won the game #{@player_score} to #{@computer_score}!"
    elsif @player_score < @computer_score
      puts "Sorry #{@player_name}. You have lost the game #{@player_score} to #{@computer_score}!"
    else
      puts "The game ended in a draw #{@player_score} to #{@computer_score}."
    end
  end

  def play_again?
    puts "Play again? Type in Y for yes and N for no: "
    choice = gets.chomp.upcase
    if choice == "Y"
      @round_count = 0
      @player_score = 0
      @computer_score = 0
      start_game
    elsif choice == "N"
      puts "Thank you for playing."
      exit!
    else
      puts "Wrong input"
      play_again?
    end
  end
end

Game.new
