import 'package:circular_widgets/circular_widgets.dart';
import 'package:flutter/material.dart';

// import 'config_widget.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int length = 5;
  CircularWidgetConfig config = const CircularWidgetConfig(
    innerSpacing: 0,
    itemRadius: 5,
    centerWidgetRadius: 10,
    startAngleDeg: -90,
    totalArchDeg: 360,
    isClockwise: true,
    isAddExtraFakeItem: true,
    drawOrder: CircularLayoutDrawOrder.itemsOnTop,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Circular Widgets'),
      ),
      // Use Layout builder for responsive behaviour
      body: Row(
        children: [
          // Expanded(
          //   child: ConfigWidget(
          //     config: config,
          //     valueSetter: (newVal) {
          //       setState(() {
          //         config = newVal;
          //       });
          //     },
          //     itemsLength: length,
          //     itemsLengthSetter: (newVal) {
          //       setState(() {
          //         length = newVal;
          //       });
          //     },
          //   ),
          // ),
          CircularWidgets(
            config: config,
            itemsLength: length,
            itemBuilder: (context, index) {
              // Can be any widget, preferably a circle
              return Container(
                color: Colors.lightBlue,
                child: Text('Box'),
              );
            },
            centerWidgetBuilder: (context) {
              return SingleCircle(
                txt: 'Center',
                color: Colors.red,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SingleCircle extends StatelessWidget {
  final String txt;
  final Color color;
  const SingleCircle({
    Key? key,
    required this.txt,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Placeholder();
    return Container(
      child: Center(child: Text(txt)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
