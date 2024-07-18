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
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: realTimeGraph(
                    ),
                  ),),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: realTimeGraph2(
                    ),
                  ),),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: realTimeGraph3(
                    ),
                  ),),
                // realTimeGraph(),
              ],
            ),
          ),
        ),
      );
    }
  }
