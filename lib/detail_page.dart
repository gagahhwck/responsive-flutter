import 'package:flutter/material.dart';
import 'package:jokes_ui/detail_widget.dart';
import 'package:jokes_ui/joke.dart';

class DetailPage extends StatelessWidget {
  final Joke? joke;
  const DetailPage({super.key, this.joke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type ?? "Tipe belum dipilih"),
      ),
      body: DetailWidgets(joke: joke),
    );
  }
}
