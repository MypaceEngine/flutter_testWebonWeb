import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:js';
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key) {
    ui.platformViewRegistry.registerViewFactory(
        createdViewId,
        (int viewId) => html.IFrameElement()
          ..width = '800'
          ..height = '400'
          ..src = 'http://www.youtube.com/embed/IyFZznAk69U'
          ..style.border = 'none');
  }
  String createdViewId = 'map_element';

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.access_time),
          onPressed: () {},
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300], width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Directionality(
              textDirection: TextDirection.ltr,
              child: HtmlElementView(
                viewType: createdViewId,
              ))),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black.withAlpha(0), elevation: 0.0,
      ),  */
    );
  }
}
