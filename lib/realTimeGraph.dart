import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_time_chart/real_time_chart.dart';
class realTimeGraph extends StatefulWidget {
  const realTimeGraph({Key? key}) : super(key: key);

  @override
  State<realTimeGraph> createState() => _realTimeGraphState();
}

class _realTimeGraphState extends State<realTimeGraph> {
  @override
  Widget build(BuildContext context) {
    final streamWt = positiveDataStream(wt);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Weight:',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RealTimeGraph(
                    stream: streamWt,
                  ),
                ),),
            ],
          ),
        ),
      ),
    );
  }
  List<double> wt=[3536.4,3466.4, 3445.7, 3505.1,3581.1,3560.5,3525.2
    ,3242.9
    ,3127.5
    ,2835.4
    ,2807
    ,2827.5
    ,2862.9
    ,2869.4
    ,2866
  ];
  Stream<double> positiveDataStream(List<double> lst) {
    // StreamController<double> controller = StreamController<double>();

    // Stream<double> numberStream = controller.stream;

    // numberStream.listen((number) {
    //     //   print(number);
    //     // });
    // Adding data to the strea
    // for (double number in wt) {
    //   controller.add(number);
    // }
    // Close the stream when done
    // controller.close();
    // Stream<double> positiveDataStream() {
    int i=lst.length-1,sz=lst.length;
    return Stream.periodic(const Duration(milliseconds: 500), (_) {
      i++;
      return lst[i%sz];
    }).asBroadcastStream();

  }
}
