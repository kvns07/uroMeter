import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_time_chart/real_time_chart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class realTimeGraph2 extends StatefulWidget {
  const realTimeGraph2({Key? key}) : super(key: key);

  @override
  State<realTimeGraph2> createState() => _realTimeGraphState();
}

class _realTimeGraphState extends State<realTimeGraph2> {
  final _channel = WebSocketChannel.connect(
    Uri.parse("ws://192.168.35.244:8080"),
  );
  @override
  Widget build(BuildContext context) {
    final streamWt = positiveDataStream(wt);
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: RealTimeGraph(
            stream: _channel.stream.map((data) {
              // print(data+ "haha2");
              // Assuming the incoming data is JSON encoded string
              // String jsonString = utf8.decode(data);
              // print(jsonString);
              final Map<String,dynamic> jsonData = json.decode(data.toString());
              // print(jsonData);
              // print(jsonData);
              // Extract the relevant value
              final value = jsonData['message'];
              final Map<String,dynamic> value2 = json.decode(value);
              // print(value2);
// print(''
              return value2['flow_rate'].toDouble();
            }),
            graphColor: Colors.greenAccent,
            graphStroke: 2,
            displayMode: ChartDisplay.points,
            xAxisColor: Colors.green,
            yAxisColor: Colors.green,
            axisTextBuilder: (value) {
              // Customize the x-axis labels
              return Text('${value.toStringAsFixed(2)} ml/hr',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                ),
              );}
        ),
      ),);
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
  @override
  void dispose() {
    _channel.sink.close();
    // _controller.dispose();
    super.dispose();
  }
}



// import 'dart:math';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:real_time_chart/real_time_chart.dart';
// class realTimeGraph2 extends StatefulWidget {
//   const realTimeGraph2({Key? key}) : super(key: key);
//
//   @override
//   State<realTimeGraph2> createState() => _realTimeGraphState();
// }
//
// class _realTimeGraphState extends State<realTimeGraph2> {
//   @override
//   Widget build(BuildContext context) {
//     final streamWt = positiveDataStream(flowrate);
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: RealTimeGraph(
//         stream: streamWt.map((value) => value),
//         graphColor: Colors.lightBlue,
//         graphStroke: 2,
//         displayMode: ChartDisplay.points,
//         xAxisColor: Colors.blue,
//         yAxisColor: Colors.blue,
//           axisTextBuilder: (value) {
//             // Customize the x-axis labels
//             return Text('${value.toStringAsFixed(2)} ml/hr',
//               style: TextStyle(
//                 fontSize: 11,
//                 color: Colors.black,
//               ),
//             );},
//       ),
//     );
//   }
//   List<double> flowrate=[0.00354,
//     0.00347,
//     0.00345,
//     0.00351,
//     0.00358,
//     0.00356,
//     0.00353,
//     0.00324,
//     0.00313,
//     0.00284,
//     0.00281,
//     0.00283,
//     0.00286,
//     0.00287,
//   ];
//   Stream<double> positiveDataStream(List<double> lst) {
//     // StreamController<double> controller = StreamController<double>();
//
//     // Stream<double> numberStream = controller.stream;
//
//     // numberStream.listen((number) {
//     //     //   print(number);
//     //     // });
//     // Adding data to the strea
//     // for (double number in wt) {
//     //   controller.add(number);
//     // }
//     // Close the stream when done
//     // controller.close();
//     // Stream<double> positiveDataStream() {
//     int i=lst.length-1,sz=lst.length;
//     return Stream.periodic(const Duration(milliseconds: 500), (_) {
//       i++;
//       return lst[i%sz]*1000000*3600;
//     }).asBroadcastStream();
//
//   }
// }
