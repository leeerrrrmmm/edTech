import 'package:course_ed_tech/core/widgets/build_img.dart';
import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:course_ed_tech/presentation/screens/BOTTOM/botton_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3)).then((_) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (_) => CustomBottomNavigationBar()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BuildImg(assetPath: 'assets/img/res.png'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: BuildText(
              text: 'Congratulations',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          BuildText(
            textAlign: TextAlign.center,
            text: 'Congratulations for getting\nall the answers correct!',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
