#include <windows.h>
#include <iostream>
#include <string>
using namespace std;

enum class gameChoices {Rock, Paper, Scissors};
inline const char* ToString(gameChoices v)
{
	switch (v)
	{
	case gameChoices::Rock:   return "Rock";
	case gameChoices::Paper:   return "Paper";
	case gameChoices::Scissors: return "Scissors";
	default:      return "";
	}
}

int leaderBoardCountPlayerOne = 0;
int leaderBoardCountPlayerTwo = 0;
int leaderBoardCountPlayerTie = 0;

gameChoices mPlayerOneValue;
gameChoices mPlayerTwoValue;

string gameMessage = "select:\n1 paper\n2 rock\n3 scissors\n";
int mPaper = 1;
int mRock = 2;
int mScissors = 3;

gameChoices validateUserInput(int playerInput) {
	if (playerInput == mPaper) {
		return gameChoices::Paper;
	}else if (playerInput == mRock) {
		return gameChoices::Rock;
	} else if (playerInput == mScissors) {
		return gameChoices::Scissors;
	}
}

int leaderBoardView() {
	cout << "\n***LEADERBOARD***\n";
	cout << "player 1: " << leaderBoardCountPlayerOne << endl << "player 2: " << leaderBoardCountPlayerTwo << endl << "TIE: " << leaderBoardCountPlayerTie << endl;
	return 0;
}
//custom function to get who won by player
int validateWinner(int name, gameChoices player1, gameChoices player2) {
	int winner = 0;
	if (player1 == gameChoices::Paper && player2 == gameChoices::Rock || //paper beats rock
		player1 == gameChoices::Scissors && player2 == gameChoices::Paper ||//scissors beat paper
		player1 == gameChoices::Rock && player2 == gameChoices::Scissors //rock beats scissors
		) {
		if (name == 1) {
			leaderBoardCountPlayerOne += 1;
		}
		else {
		leaderBoardCountPlayerTwo += 1;
		}
		cout << "\nWINNER: Player " << name << endl;
	}
	else if (player1 == player2) {
		cout << "\nWINNER: tie!\n";
		leaderBoardCountPlayerTie += 1;
	}
	else {
		winner = 1;
	}

	leaderBoardView();
	return winner;
}
int gamePlayer(string name) {
	int playerValue;
	do {
		cout << "\nPlayer " << name << "..." << gameMessage << "(input is not visible): ";
		cin >> playerValue;
		cin.clear();
		cin.ignore(100, '\n');
	} while (1 > playerValue || 3 < playerValue);
	cout << "\nplayer " << name << " has selected their option\n";
	if (name == "one") {
		mPlayerOneValue = validateUserInput(playerValue);
	}
	else {
		mPlayerTwoValue = validateUserInput(playerValue);
	}
	return 0;
}

int main()
{
	cout << "Hello World!\n";

	leaderBoardView();

	while (true) {
		//this function hides input from the user
		//ie, input is not displayed in the console
		HANDLE hStdin = GetStdHandle(STD_INPUT_HANDLE);
		DWORD mode = 0;
		GetConsoleMode(hStdin, &mode);
		SetConsoleMode(hStdin, mode & (~ENABLE_ECHO_INPUT));

		//function to validate user input
		gamePlayer("one");
		//function to validate user input
		gamePlayer("two");

		//displays after last player has chosen
		cout << "\nPlayer1 chose " << ToString(mPlayerOneValue) << "\nPlayer2 chose " << ToString(mPlayerTwoValue) << endl;

		if (validateWinner(1, mPlayerOneValue, mPlayerTwoValue) != 0) {
			validateWinner(2, mPlayerTwoValue, mPlayerOneValue);
		}
	}
}