import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_time_chart/real_time_chart.dart';
class realTimeGraph3 extends StatefulWidget {
  const realTimeGraph3({Key? key}) : super(key: key);

  @override
  State<realTimeGraph3> createState() => _realTimeGraphState();
}

class _realTimeGraphState extends State<realTimeGraph3> {
  @override
  Widget build(BuildContext context) {
    final streamWt = positiveDataStream(volume);
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RealTimeGraph(
          stream: streamWt.map((value) => value),
          graphColor: Colors.redAccent,
          graphStroke: 2,
          displayMode: ChartDisplay.points,
          xAxisColor: Colors.red,
          yAxisColor: Colors.red,
          // a
          axisTextBuilder: (value) {
            // Customize the x-axis labels
            return Text('${value.toStringAsFixed(2)} ml',
              style: TextStyle(
                fontSize: 11,
                color: Colors.black,
              ),
            );},
        ),
      ),);
  }
  List<double> volume=[0.00354,
    0.00347,
    0.00345,
    0.00351,
    0.00358,
    0.00356,
    0.00353,
    0.00324,
    0.00313,
    0.00284,
    0.00281,
    0.00283,
    0.00286,
    0.00287,
    0.00287,
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
      return lst[i%sz]*1000000;
    }).asBroadcastStream();

  }
}
class DisplayDoubleWidget extends StatelessWidget {
  final double value;

  DisplayDoubleWidget(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
      style: TextStyle(fontSize: 24),
    );
  }
}
