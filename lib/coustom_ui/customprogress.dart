import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  @override
  _CustomCircularProgressIndicatorState createState() => _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState extends State<CustomCircularProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15), // Adjust the duration for slower animation
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80.0, // Adjust the size as needed
        width: 80.0,  // Adjust the size as needed
        child: CircularProgressIndicator(
          valueColor: _controller.drive(ColorTween(
            begin: Colors.blue,
            end: Colors.red,
          )),
          strokeWidth: 5.0, // Adjust the stroke width as needed
        ),
      ),
    );
  }
}
