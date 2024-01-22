import 'package:flutter/material.dart';
import 'package:jokes_ui/joke.dart';

class DetailWidgets extends StatelessWidget {
  const DetailWidgets({
    super.key,
    required this.joke,
  });

  final Joke? joke;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(joke?.setup ?? "setup belum dipilih"),
          Text(joke?.punchline ?? "punchline belum dipilih"),
        ],
      ),
    );
  }
}
