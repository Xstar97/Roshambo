import sys


class Game:
    rock = 1
    paper = 2
    scissors = 3

    def __init__(self, pl1=0, pl2=0):
        self.player1 = pl1
        self.player2 = pl2

    def set_player_one_value(self, value):
        self.player1 = value

    def set_player_two_value(self, value):
        self.player2 = value

    def get_winner(self, name, pl1, pl2):
        if int(pl1) == self.rock and int(pl2) == self.scissors:  # pl 1 wins rock beats scissors
            print("\nWINNER: player " + name + "!")
            return 0
        elif int(pl1) == self.paper and int(pl2) == self.rock:  # pl 1 wins paper beats rock
            print("\nWINNER: player " + name + "!")
            return 0
        elif int(pl1) == self.scissors and int(pl2) == self.paper:  # pl 1 wins scissors beats paper
            print("\nWINNER: player " + name + "!")
            return 0
        elif int(pl1) == int(pl2):  # tie
            print("\nWINNER: Tie:/")
            return 0
        else:
            return 1

    def game_player(self, player, name):
        while True:
            player = input("\nPlayer " + name + " select => \n [1] Rock\n [2]Paper\n [3]Scissors\n\ntype: ")
            if player not in "123" or player == "":
                print("please only select either rock, paper, or scissors...")
                continue
            sys.stdout.write('\r\r\b\b')
            sys.stdout.flush()
            if name == "one":
                self.set_player_one_value(player)
            else:
                self.set_player_two_value(player)
            break


if __name__ == '__main__':

    my_game = Game()
    print("Hello World,\nLets play rock, paper, scissors!")
    while True:
        my_game.game_player(my_game.player1, "one")
        my_game.game_player(my_game.player2, "two")

        if my_game.get_winner("1", my_game.player1, my_game.player2) != 0:
            my_game.get_winner("2", my_game.player2, my_game.player1)
