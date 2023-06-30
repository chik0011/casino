import 'package:flutter/material.dart';
import 'dart:math';
import 'package:collection/collection.dart';

class Casino extends StatefulWidget {
  const Casino({super.key, required this.title});
  final String title;

  @override
  State<Casino> createState() => _CasinoState();
}

class _CasinoState extends State<Casino> {
  List<int> _draw = [1, 2, 3];
  Function eq = const ListEquality().equals;

  void _setNewDraw() {
    setState(() {
      _draw = getRandomNumber();
    });
  }

  List<int> getRandomNumber() {
    Random rng = Random();
    List<int> res = [];

    for (var i = 0; i < 3; i++) {
      res.add(rng.nextInt(7) + 1);
    }

    return res;
  }

  String getPathPictureByDraw(int daw) {
    if (daw == 1) {
      return 'images/bar.png';
    } else if (daw == 2) {
      return 'images/cerise.png';
    } else if (daw == 3) {
      return 'images/cloche.png';
    } else if (daw == 4) {
      return 'images/diamant.png';
    } else if (daw == 5) {
      return 'images/fer-a-cheval.png';
    } else if (daw == 6) {
      return 'images/pasteque.png';
    } else {
      return 'images/sept.png';
    }
  }

  bool isWin() {
    int res = _draw
        .map((element) => element == _draw[0] ? 1 : 0)
        .reduce((value, element) => value + element);

    if (res == 3) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(widget.title,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i in _draw)
                  Image.asset(getPathPictureByDraw(i), height: 120),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    isWin() ? "Gagné" : "Perdu",
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {_setNewDraw()},
          tooltip: 'Increment',
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          child: const Icon(Icons.autorenew)),
    );
  }
}

class GreenBackground extends StatelessWidget {
  // this is the root of the application
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        border: Border.all(
          color: Colors.blue,
          width: 10,
        ),
      ),
    );
  }
}
