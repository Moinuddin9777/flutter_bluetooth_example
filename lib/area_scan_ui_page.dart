import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians, Vector3;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    // ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key? key, required this.controller})
      : translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.elasticOut),
        ),
        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.7,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> rotation;
  final Animation<double> translation;
  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return
              // Transform.rotate(
              //     // angle: radians(rotation.value),
              //     child:
              Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildButton(15,
                  color: Colors.red, icon: FontAwesomeIcons.thumbtack),
              _buildButton(65,
                  color: Colors.green, icon: FontAwesomeIcons.sprayCan),
              _buildButton(110,
                  color: Colors.orange, icon: FontAwesomeIcons.fire),
              _buildButton(155,
                  color: Colors.blue, icon: FontAwesomeIcons.kiwiBird),
              _buildButton(200,
                  color: Colors.black, icon: FontAwesomeIcons.cat),
              _buildButton(245,
                  color: Colors.indigo, icon: FontAwesomeIcons.paw),
              _buildButton(290,
                  color: Colors.pink, icon: FontAwesomeIcons.bong),
              _buildButton(335,
                  color: Colors.yellow, icon: FontAwesomeIcons.bolt),
              Transform.scale(
                scale: scale.value - 1,
                child: FloatingActionButton(
                    child: Icon(FontAwesomeIcons.timesCircle),
                    onPressed: _close,
                    backgroundColor: Colors.red),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                    child: Icon(FontAwesomeIcons.solidDotCircle),
                    onPressed: _open),
              )
            ],
          );
          //);
        });
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, {Color? color, IconData? icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            onPressed: _close,
            elevation: 9));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ScanPageTwo extends StatefulWidget {
  const ScanPageTwo({super.key});

  @override
  State<ScanPageTwo> createState() => _ScanPageTwoState();
}

class _ScanPageTwoState extends State<ScanPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Center(
        child: RadialMenu(),
      ),
    );
  }
}

// /// APPROACH 1: to use staggered grid view ///
//   //  StaggeredGridView.count(
//   //   crossAxisCount: 4,
//   //   children: List.generate(
//   //       3,
//   //       (index) => Center(
//   //             child: CircleAvatar(
//   //               radius: 64,
//   //               backgroundColor: Colors.pink,
//   //             ),
//   //           )),
//   //   staggeredTiles: [
//   //     StaggeredTile.count(2, 2), // takes up 2 rows and 2 columns space
//   //     StaggeredTile.count(2, 1), // takes up 2 rows and 1 column
//   //     StaggeredTile.count(1, 2), // takes up 1 row and 2 column space
//   //   ], // scatter them randomly
//   // );

// StaggeredGrid.count(
//   crossAxisCount: 4,
//   children: [
//     StaggeredGridTile.count(
//             mainAxisCellCount: 4,
//             crossAxisCellCount: 1,
//             child: Container(
//               child: Text("AAAAAAAAAAAAAAAA"),
//               height: 50,
//               width: 50,
//               color: Colors.amber,
//             ),
//           ),
//     StaggeredGridTile.count(
//       mainAxisCellCount: 1,
//       crossAxisCellCount: 2,
//       child: Container(
//         child: Text("AAAAAAAAAAAAAAAA"),
//         height: 50,
//         width: 50,
//         color: Colors.cyan,
//       ),
//     ),
//     StaggeredGridTile.count(
//       mainAxisCellCount: 4,
//       crossAxisCellCount: 1,
//       child: Container(
//         child: Text("AAAAAAAAAAAAAAAA"),
//         height: 50,
//         width: 50,
//         color: Colors.deepPurple,
//       ),
//     ),
//     StaggeredGridTile.count(
//       mainAxisCellCount: 1,
//       crossAxisCellCount: 4,
//       child: Container(
//         child: Text("AAAAAAAAAAAAAAAA"),
//         height: 50,
//         width: 50,
//         color: Colors.orangeAccent,
//       ),
//     ),
//   ],
// ),
