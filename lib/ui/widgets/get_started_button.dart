import 'package:flutter/material.dart';

import 'package:scan_mo/ui/widgets/custom_elevated_button.dart';

class GetStartedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  GetStartedButton({this.onPressed});
  @override
  _GetStartedButtonState createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 100 - 100 * _animation.value),
      child: CustomElevatedButton(
        onPressed: widget.onPressed,
      ),
    );
  }
}
