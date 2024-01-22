import 'package:flutter/material.dart';
import 'package:jokes_ui/detail_page.dart';
import 'package:jokes_ui/detail_widget.dart';
import 'package:jokes_ui/joke.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Joke? jokeChoose;
  @override
  Widget build(BuildContext context) {
    // mendapatkan lebar hpnya
    final width = MediaQuery.sizeOf(context).width;
    // mendapatkan orientasi hpnya
    final orientation = MediaQuery.orientationOf(context);

    late Widget content;

    if (orientation == Orientation.landscape && width > 600) {
      // MODE TABLET
      content = _BuildTabMode();
    } else {
      // MODE HP
      content = _BuildHpMode();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: content,
    );
  }

  Widget _BuildHpMode() {
    return ListJokeWidget(chooseJokeCallback: (joke) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            joke: joke,
          ),
        ),
      );
    });
  }

  Widget _BuildTabMode() {
    return Row(
      children: [
        Flexible(
            child: ListJokeWidget(
          jokeChoose: jokeChoose,
          chooseJokeCallback: (joke) {
            setState(() {
              jokeChoose = joke;
            });
          },
        )),
        Flexible(
          child: Container(
            color: Colors.orange,
            child: DetailWidgets(joke: null),
          ),
        ),
      ],
    );
  }
}

class ListJokeWidget extends StatelessWidget {
  final Joke? jokeChoose;
  final ValueChanged<Joke> chooseJokeCallback;
  const ListJokeWidget({
    super.key,
    required this.chooseJokeCallback,
    this.jokeChoose,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokesList.length,
      itemBuilder: (context, index) {
        final joke = jokesList[index];
        return ListTile(
          title: Text(joke.setup),
          onTap: () {
            chooseJokeCallback(joke);
          },
          selected: jokeChoose == joke,
          selectedColor: Colors.blue,
        );
      },
    );
  }
}
