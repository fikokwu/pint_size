import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatefulWidget {

  @override
  _RadialProgressState createState() => _RadialProgressState();

  final double goalCompleted = _RadialProgressState.calculateGoalCompleted();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  final Duration fadeInDuration = Duration(milliseconds: 500);
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;

  double progressDegrees;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });
    _radialProgressAnimationController.forward();
  }

  static double calculateGoalCompleted() {
    double goalToBeCompleted = 30.0;
    double soFarCompleted = 20.0;
    double totalCompletedSoFar = soFarCompleted / goalToBeCompleted;
    return totalCompletedSoFar;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      
      child: Container(
        height: 285,
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 90.0),
        child: AnimatedOpacity(
         
          opacity: progressDegrees > 30 ? 1.0 : 0.0,
          duration: fadeInDuration,
          
          child: Column(
            children: <Widget>[
              Text(
                'DONNATION',
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 1.7,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                height: 4.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xffc9470f),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                '20',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                'BLOOD DONATIONS',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
      painter: RadialPainter(progressDegrees),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint completedPaint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2, completedPaint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
              colors: [Color(0xffc9470f), Color(0xffddac00), Color(0xffddac00)])
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  } // paint

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
