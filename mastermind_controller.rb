module MastermindGame
  COLORS = ["red","blue","green","yellow","black","white"]


class MastermindController
 

  

  # enable :sessions 

  def initialize

  end
end

class SecretCode
  attr_reader :code

  def initialize
    @code = create_code
  end

  def create_code
    secret = []
    for i in 0..3
      secret << COLORS.sample
    end
    secret
  end
end

end

class Guess
  attr_reader :correct_in_position, :correct_outof_position, :guess_feedback

  def initialize(selection)
    @counter = 0
    @selection = selection
    @tally_colors_secret = $secret.code.each_with_object({}) do |e,h|
          h[e] ? h[e] += 1 : h[e] = 1
      end
    @tally_colors_selection = @selection.each_with_object({}) do |e,h|
          h[e] ? h[e] += 1 : h[e] = 1
      end
    @guess_feedback = guess_results
  end

  def guess_results
    guess=[]
    inpos = correct_in_position
    outpos = (inpos - correct_determination).abs
    guess.push(inpos, outpos)

    guess
  end

  private
    def correct_determination
      hsh_outcome = {}
      hsh_temp = {}
      @tally_colors_secret.each do |k,v|
        if @tally_colors_selection.include? k
          hsh_temp[k] = (v-@tally_colors_selection[k]).abs
        end
      end

      hsh_temp.keys.each do |k|
        if @tally_colors_secret[k] > hsh_temp[k]
          hsh_outcome[k] = (@tally_colors_secret[k]-hsh_temp[k])
        elsif @tally_colors_secret[k] <= hsh_temp[k]
          hsh_outcome[k] = @tally_colors_secret[k]
        end   
      end
      correct =hsh_outcome.values.inject { |sum, n| sum.to_i + n }

      correct.to_i
    end

    def correct_in_position
      @counter = 0
      for i in 0..3 do
        if $secret.code[i] == @selection[i]
          @counter += 1
        end
      end
      @counter  
    end 
end

# class Display
#   def initialize(positions)
#     @positions = positions
#     show_response
#   end

#   def show_response
#     puts
#     print "RESULT: "
#     for i in 1..@positions[1]
#       print "x"
#     end
#     for i in 1..@positions[0]
#       print "X"
#     end
#     puts
#   end

#   def turn_number(turn)
#     print "Turn number #{turn} completed. #{12-turn} " 
#     if turn < 11
#       print "turns left."
#     else
#       print "turn left."
#     end
#     puts
#   end
# end

# class Player
#   attr_reader :pick_colors
#   def pick_colors
#     selections=[]
#     until selections.length == 4
#       puts "pick a color (red,blue,green,yellow,black,white)"
#       choice = gets.chomp
#       if COLORS.include?(choice)
#         selections << choice
#       else
#         puts "That is not one of the possible colors."
#       end
#     end
#     selections
#   end
# end 

# $secret = SecretCode.new 

# guessing_player = Player.new
# turn = 1
# while turn < 13
#   selections = guessing_player.pick_colors  
#   guess = Guess.new(selections)
#   if guess.guess_feedback[0] == 4
#     puts "you win!"
#     break
#   else
#     display = Display.new(guess.guess_feedback)
#     display.turn_number(turn)
#   end
#   turn += 1
# end
# if turn > 12
#   puts "Sorry. you failed to guess the code in 12 turns."
#   puts
#   puts "The secret code is #{$secret.code}"
#   puts

# end
