class TennisGame
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @player1Points = 0
    @player2Points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end

  def p1Score
    @player1Points +=1
  end
  
  def p2Score
    @player2Points +=1
  end
end

class TennisGame1 < TennisGame
  def score
    result = ""
    tempScore=0
    if (@player1Points==@player2Points)
      result = {
          0 => "Love-All",
          1 => "Fifteen-All",
          2 => "Thirty-All",
      }.fetch(@player1Points, "Deuce")
    elsif (@player1Points>=4 or @player2Points>=4)
      minusResult = @player1Points-@player2Points
      if (minusResult==1)
        result ="Advantage player1"
      elsif (minusResult ==-1)
        result ="Advantage player2"
      elsif (minusResult>=2)
        result = "Win for player1"
      else
        result ="Win for player2"
      end
    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @player1Points
        else
          result+="-"
          tempScore = @player2Points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end
end

class TennisGame2 < TennisGame
  def score
    result = ""
    if (@player1Points == @player2Points and @player1Points < 3)
      if (@player1Points==0)
        result = "Love"
      end
      if (@player1Points==1)
        result = "Fifteen"
      end
      if (@player1Points==2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@player1Points==@player2Points and @player1Points>2)
        result = "Deuce"
    end
    
    player1Result = ""
    player2Result = ""
    if (@player1Points > 0 and @player2Points==0)
      if (@player1Points==1)
        player1Result = "Fifteen"
      end
      if (@player1Points==2)
        player1Result = "Thirty"
      end
      if (@player1Points==3)
        player1Result = "Forty"
      end
      player2Result = "Love"
      result = player1Result + "-" + player2Result
    end
    if (@player2Points > 0 and @player1Points==0)
      if (@player2Points==1)
        player2Result = "Fifteen"
      end
      if (@player2Points==2)
        player2Result = "Thirty"
      end
      if (@player2Points==3)
        player2Result = "Forty"
      end
      
      player1Result = "Love"
      result = player1Result + "-" + player2Result
    end
    
    if (@player1Points>@player2Points and @player1Points < 4)
      if (@player1Points==2)
        player1Result="Thirty"
      end
      if (@player1Points==3)
        player1Result="Forty"
      end
      if (@player2Points==1)
        player2Result="Fifteen"
      end
      if (@player2Points==2)
        player2Result="Thirty"
      end
      result = player1Result + "-" + player2Result
    end
    if (@player2Points>@player1Points and @player2Points < 4)
      if (@player2Points==2)
        player2Result="Thirty"
      end
      if (@player2Points==3)
        player2Result="Forty"
      end
      if (@player1Points==1)
        player1Result="Fifteen"
      end
      if (@player1Points==2)
        player1Result="Thirty"
      end
      result = player1Result + "-" + player2Result
    end
    if (@player1Points > @player2Points and @player2Points >= 3)
      result = "Advantage " + @player1Name
    end
    if (@player2Points > @player1Points and @player1Points >= 3)
      result = "Advantage " + @player2Name
    end
    if (@player1Points>=4 and @player2Points>=0 and (@player1Points-@player2Points)>=2)
      result = "Win for " + @player1Name
    end
    if (@player2Points>=4 and @player1Points>=0 and (@player2Points-@player1Points)>=2)
      result = "Win for " + @player2Name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end
end

class TennisGame3 < TennisGame
  def score
    if (@player1Points < 4 and @player2Points < 4) and (@player1Points + @player2Points < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@player1Points]
      @player1Points == @player2Points ? s + "-All" : s + "-" + p[@player2Points]
    else
      if (@player1Points == @player2Points)
        "Deuce"
      else
        s = @player1Points > @player2Points ? @player1Name : @player2Name
        (@player1Points-@player2Points)*(@player1Points-@player2Points) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
