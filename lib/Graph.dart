import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_time_chart/real_time_chart.dart';
import 'package:urometer/Graph.dart';
import 'package:urometer/realTImeGraph2.dart';
import 'realTimeGraph.dart';
import 'realTImeGraph3.dart';
class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
   Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Patient's Data"),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Volume:',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: realTimeGraph(
                    ),
                  ),),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'FlowRate:',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: realTimeGraph2(
                    ),
                  ),),
                // Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: Text(
                //     'Volume:',
                //   ),
                // ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.width * 0.6,
                //   child: Padding(
                //     padding: const EdgeInsets.all(16.0),
                //     child: realTimeGraph3(
                //     ),
                //   ),),
                // realTimeGraph(),
              ],
            ),
          ),
        ),
      );
    }
  // final channel = WebSocketChannel.connect(
  //   Uri.parse('wss://echo.websocket.events'),
  // );
  // StreamBuilder(
  // stream: channel.stream,
  // builder: (context, snapshot) {
  // return Text(snapshot.hasData ? '${snapshot.data}' : '');
  // },
  // )
  }
