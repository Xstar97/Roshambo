import 'package:flutter/material.dart';
import 'package:roshambo/config/constants.dart';
import 'package:roshambo/generated/l10n.dart';

GameChoices playerValueOne;
GameChoices playerValueTwo;

var currentPlayerName;
var leaderBoardCountPlayerOne = 0;
var leaderBoardCountPlayerTwo = 0;
var leaderBoardCountPlayerTie = 0;

class BaseGamePage extends StatefulWidget {
  final String title, playerNameOne, playerNameTwo;
  final GameMode mode;
  const BaseGamePage({Key key, this.title, this.mode, this.playerNameOne, this.playerNameTwo}) : super(key: key);

  @override
  _BaseGamePageState createState() => _BaseGamePageState();
}
class _BaseGamePageState extends State<BaseGamePage> {

  @override
  void initState() {
    currentPlayerName = widget.playerNameOne;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void newGame() {
    setState(() {
      playerValueOne = null;
      playerValueTwo = null;
      currentPlayerName = widget.playerNameOne;
    });
  }

  int validateWinner(BuildContext context, String name, GameChoices player1, GameChoices player2) {
      int winner = 0;
      if (player1 == GameChoices.Paper &&
          player2 == GameChoices.Rock || //paper beats rock
          player1 == GameChoices.Scissors &&
              player2 == GameChoices.Paper || //scissors beats paper
          player1 == GameChoices.Rock &&
              player2 == GameChoices.Scissors) //rock beats scissors
          {
        if (name == widget.playerNameOne) {
          leaderBoardCountPlayerOne += 1;
        } else {
          leaderBoardCountPlayerTwo += 1;
        }
        dialogGameOverMessage(name, winner);
      } else if (player1 == player2) {
        leaderBoardCountPlayerTie += 1;
        dialogGameOverMessage(name, 3);
      } else {
        winner = 1;
      }
      return winner;
    }


  void onMultiCancel(){
    Navigator.of(context).pop();
  }
  void dialogServerValidation(){
    showDialog<void>(
      barrierDismissible: false,
      context: context, // user must tap button!
      builder: (BuildContext alert) {
        return AlertDialog(
          title: Center(child: Text(S.of(context).gameMessageWaiting),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(S.of(context).gamePlayerSelected(widget.playerNameOne,
                  gameChoicesToString(context, playerValueOne))),
              Text(S.of(context).gamePlayerSelected(widget.playerNameTwo,
                  gameChoicesToString(context, playerValueTwo))),
              RaisedButton(child: Text(S.of(context).gameActionCancel, textAlign: TextAlign.center,), onPressed: onMultiCancel
                ,)

            ],
          ),
        );
      },
    );
  }

  void onItemSelected(GameChoices value) async {
      if (widget.mode == GameMode.Offline) {
        setState(() {//local
          if (currentPlayerName == widget.playerNameOne) {
            playerValueOne = value;
          } else {
            playerValueTwo = value;
          }
          currentPlayerName = currentPlayerName == widget.playerNameOne
              ? widget.playerNameTwo
              : widget.playerNameOne;
          if (validateWinner(
              context, widget.playerNameOne, playerValueOne, playerValueTwo) !=
              0) {
            validateWinner(
                context, widget.playerNameTwo, playerValueTwo, playerValueOne);
          }
        });
      } else{//server
        //TODO add user validation
        dialogServerValidation();
      }

    }

  void dialogGameOverMessage(String name, int winner) {
      bool isWinner = winner != 0;
      showDialog<void>(
        context: context, // user must tap button!
        builder: (BuildContext alert) {
          return AlertDialog(
            title: Center(child: Text(S.of(context).gameOverTitle),),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(S.of(context).gamePlayerSelected(widget.playerNameOne,
                    gameChoicesToString(context, playerValueOne))),
                Text(S.of(context).gamePlayerSelected(widget.playerNameTwo,
                    gameChoicesToString(context, playerValueTwo))),
                isWinner ?
                Text(S.of(context).gameOverMessageTie)
                    :
                Text(S.of(context).gamePlayerWon(name))
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(S.of(context).gameActionNew),
                onPressed: () {
                  newGame();
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

    Widget leaderBoardView() {
      return Visibility(
        visible: widget.mode == GameMode.Online ? false : true,
        child: Column(
          children: <Widget>[
            Text(S.of(context).leaderBoardPlayer(
                widget.playerNameOne, leaderBoardCountPlayerOne)),
            Text(S.of(context).leaderBoardPlayer(
                widget.playerNameTwo, leaderBoardCountPlayerTwo)),
            Text(S.of(context).leaderBoardPlayerTie(leaderBoardCountPlayerTie)),
          ],
        ),
      );
    }

    Widget gridViewSelection = Container(
      width: 400,
      height: 150,
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
              child: Center(child: gameChoicesToImages(context, value),),
            ), // Pass iconData and a boolean that specifies if the icon is selected or not
          );
        }).toList(), // Convert the map to a list of widgets
      ),);

    Widget gameView = SingleChildScrollView(
      child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                leaderBoardView(),
                Text(S.of(context).currentGamePlayer(currentPlayerName),
                  style: TextStyle(fontSize: 25),),
                gridViewSelection,
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title, textAlign: TextAlign.center,),),
      ),
      body: Center(
        child: gameView,
      ),
    );
  }
}