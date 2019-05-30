import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
//Based on - An introduction to unit testing [https://flutter.dev/docs/cookbook/testing/unit/introduction & https://flutter.dev/docs/cookbook/testing/unit/mocking]
import 'package:http/http.dart' as http;

import 'post.dart';
import 'todo_list.dart';

Future<Post> fetchPost(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('failed to load post');
  }
}

void main() {
  http.Client client = http.Client();
//  runApp(MyApp(post: fetchPost(client)));
  runApp(TodoList());
}

class MyApp extends StatelessWidget {
  final Future<Post> post;

  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Unit Testing & Mockito',
        post: post,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Future<Post> post;

  MyHomePage({Key key, this.title, this.post}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Post>(
              future: widget.post,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      snapshot.data.title,
                      textAlign: TextAlign.center,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 50.0,
              width: 200.0,
              child: Divider(
                height: 1.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // Provide a Key to this specific Text Widget. This allows us
              // to identify this specific Widget from inside our test suite and
              // read the text.
              key: Key('counter'),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a Key to this the button. This allows us to find this
        // specific button and tap it inside the test suite.
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
