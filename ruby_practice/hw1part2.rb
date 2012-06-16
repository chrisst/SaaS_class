#!/usr/bin/ruby -w

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
class String
    def beats?(str)

        if self.downcase == "r"
            return str.downcase != "p"
        elsif self.downcase == "p"
            return str.downcase != "s"
        else
            return str.downcase != "r"
        end
    end
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2

    if not "rps".include? game[0][1].downcase or not "rps".include? game[1][1].downcase
        raise NoSuchStrategyError
    end

    if game[0][1].beats? game[1][1]
        return game[0]
    end

    return game[1]
end

def rps_tournament_winner(tournament)
    left = tournament[0]
    right = tournament[1]
    if tournament.length < 2
        raise WrongNumberOfPlayersError
    end

    if left[0].instance_of? String
        return rps_game_winner(tournament)
    end

    return rps_game_winner([rps_tournament_winner(left), 
        rps_tournament_winner(right)])
end

game = [ [ "Armando", "P" ], [ "Dave", "S" ] ]
puts rps_game_winner(game).inspect

tourney = 
[
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]

puts tourney.inspect
