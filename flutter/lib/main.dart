import 'package:flutter/material.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage()
  ));
}
class GamePage extends StatefulWidget {

  @override
  _GamePageState createState() => _GamePageState();
}
enum GameChoices {
  Rock,
  Paper,
  Scissors,
}
_gameChoicesToString(BuildContext context, GameChoices choices){
  switch (choices) {
    case GameChoices.Rock:
      return S.of(context).gameChoiceRock;
    case GameChoices.Paper:
      return S.of(context).gameChoicePaper;
    case GameChoices.Scissors:
      return S.of(context).gameChoiceScissors;
    default:
      return "";
  }
}

var gameChoices = [GameChoices.Rock, GameChoices.Paper,GameChoices.Scissors];

var playerNameOne;
var playerNameTwo;
GameChoices playerValueOne;
GameChoices playerValueTwo;

var currentPlayerName = playerNameOne;
var leaderBoardCountPlayerOne = 0;
var leaderBoardCountPlayerTwo = 0;
var leaderBoardCountPlayerTie = 0;

class _GamePageState extends State<GamePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    playerNameOne = S.of(context).playerNameOne;
    playerNameTwo = S.of(context).playerNameTwo;
    super.didChangeDependencies();
  }
  void restartGame(){
    setState(() {
      playerValueOne = null;
      playerValueTwo = null;
      currentPlayerName = playerNameOne;
    });
  }

  int validateWinner(BuildContext context, String name, GameChoices player1, GameChoices player2){
    int winner = 0;
    if(player1 == GameChoices.Paper && player2 == GameChoices.Rock ||//paper beats rock
        player1 == GameChoices.Scissors && player2 == GameChoices.Paper ||//scissors beats paper
        player1 == GameChoices.Rock && player2 == GameChoices.Scissors)//rock beats scissors
    {
      if(name == playerNameOne){
        leaderBoardCountPlayerOne +=1;
      }else{
        leaderBoardCountPlayerTwo +=1;
      }
      dialogGameOverMessage(name, winner);
    } else if(player1 == player2){
      leaderBoardCountPlayerTie +=1;
      dialogGameOverMessage(name, 3);
    } else{
      winner = 1;
    }
    return winner;
  }

  void onItemSelected(GameChoices value) async{
    setState(() {
      if(currentPlayerName == playerNameOne){
        playerValueOne = value;
      } else{
        playerValueTwo = value;
      }
      currentPlayerName = currentPlayerName == playerNameOne ? playerNameTwo : playerNameOne;
      if(validateWinner(context, playerNameOne, playerValueOne, playerValueTwo) != 0){
        validateWinner(context, playerNameTwo, playerValueTwo, playerValueOne);
      }
    });
  }

  void dialogGameOverMessage(String name, int winner){
    bool isWinner = winner != 0;
    showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext alert) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).gameOverTitle),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Text(S.of(context).gamePlayerSelected(playerNameOne, _gameChoicesToString(context, playerValueOne))),
              Text(S.of(context).gamePlayerSelected(playerNameTwo, _gameChoicesToString(context, playerValueTwo))),
              isWinner ? Text(S.of(context).gameOverMessageTie) : Text(S.of(context).gamePlayerWon(name))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(S.of(context).gameOverActionRestart),
              onPressed: () {
                restartGame();
                Navigator.of(alert).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget leaderBoardView(){
      return Column(
        children: <Widget>[
          Text(S.of(context).leaderBoardPlayer(playerNameOne, leaderBoardCountPlayerOne)),
          Text(S.of(context).leaderBoardPlayer(playerNameTwo, leaderBoardCountPlayerTwo)),
          Text(S.of(context).leaderBoardPlayerTie(leaderBoardCountPlayerTie)),
        ],
      );
    }
    Widget gridViewSelection = Container(
      width: 400,
      height: 400,
      child: GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 3,
        padding: const EdgeInsets.all(10),
        children: gameChoices.map((value) {
          return InkWell(
            onTap: () {
              onItemSelected(value);
            },
            child: Container(
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  border: Border.all()), //       <--- BoxDecoration here
              child: Center(child: Text(_gameChoicesToString(context, value), style: TextStyle(fontSize: 25)),),
            ), // Pass iconData and a boolean that specifies if the icon is selected or not
          );
        }).toList(), // Convert the map to a list of widgets
      ),);

    Widget gameView() {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            leaderBoardView(),
            Text(S.of(context).currentGamePlayer(currentPlayerName), style: TextStyle(fontSize: 25),),
            gridViewSelection,
          ],
        ),);
    }
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(S.of(context).title, textAlign: TextAlign.center,),),
      ),
      body: Center(
        child: gameView(),
      ),
    );
  }
}