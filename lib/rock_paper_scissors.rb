class RockPaperScissors
  def initialize
    
    raise NoSuchStrategyError
    @rock = ['Armando','R']  
    @paper = ['Dave','P'] 
    @scissors = ['Sam','S']
  end
  

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError 
    def initialize
      message = "The strategy wasnt R, P, or S"
      puts message
      return message
    end
  end
  
  def self.winner(player1, player2)
    
      #player2 checked here. player1 check in following if statements
      if(player2[1].to_s != 'P' && player2[1].to_s != 'R' && player2[1].to_s != 'S')
          #puts "test"
          raise NoSuchStrategyError
      end
    
      if player1[1].to_s == 'R'
         # puts "rock"#player1
          if player2[1].to_s == 'P'
              return player2
          else
              return player1
          end
      elsif player1[1].to_s == 'P'
          #puts 'Paper'
          if player2[1].to_s == 'S'
              return player2
          else
              return player1
          end
      elsif player1[1].to_s == 'S'
          if player2[1].to_s == 'R'
              return player2
          else
              return player1
          end
      else
          raise NoSuchStrategyError
      end
      
      
      
  end
  
    def self.tournament_winner(tournament)
      
      p1 = tournament[0]
      p2 = tournament[1]
      
      p1_type = tournament[0][0]
      
      if !p1_type.instance_of? Array
         
          return self.winner(p1, p2)
         
      end
      
      
      winner1 = self.tournament_winner(p1)
      winner2 = self.tournament_winner(p2)
      
      winner_array = [winner1,winner2]
      return self.tournament_winner(winner_array)
      
  end

end

