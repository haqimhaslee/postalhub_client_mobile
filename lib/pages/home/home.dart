import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/newsletter/widget_homescreen.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/carousel/carousel_ads.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/quickaction_widget.dart';
import 'package:postalhub_tracker/pages/profile/widget/profile_widget.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/greetings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: ClipRRect(
                  child: SizedBox(width: 500, child: Greetings()),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 600,
                    child: kIsWeb ? null : ProfileOverviewWidget(),
                  ),
                )),
            if (!kIsWeb)
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 15, 12, 0),
                  child: ClipRRect(
                    child: SizedBox(
                      width: 450,
                      child: QuickactionWidget(),
                    ),
                  )),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 600,
                    child: CarouselAds(),
                  ),
                )),
            if (kIsWeb)
              Padding(
                  padding: EdgeInsets.fromLTRB(12, 15, 12, 0),
                  child: ClipRRect(
                    child: SizedBox(
                      width: 450,
                      child: QuickactionWidget(),
                    ),
                  )),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 500,
                    child: AnnouncementWidget(),
                  ),
                ))
          ],
        ),
      ],
    ));
  }
}

class SquigglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 105, 105, 105)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    double waveHeight = 5;
    double waveLength = 15;

    path.moveTo(0, size.height / 2);

    for (double x = 0; x <= size.width; x += waveLength) {
      path.relativeQuadraticBezierTo(
        waveLength / 2,
        -waveHeight,
        waveLength,
        0,
      );
      path.relativeQuadraticBezierTo(
        waveLength / 2,
        waveHeight,
        waveLength,
        0,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
