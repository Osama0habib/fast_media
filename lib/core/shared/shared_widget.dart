import 'package:flutter/material.dart';

import '../../colors/colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnakeBar(
    context, error) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:
        Center(child: Text(error, style: const TextStyle(color: Colors.white))),
    backgroundColor: kSeconderyColor.withOpacity(0.5),
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    behavior: SnackBarBehavior.floating,
  ));
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AbsorbPointer(
      absorbing: true,
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.black45,
        child: Center(
            child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kSeconderyColor,
          ),
          child: const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Loading..."),
                SizedBox(
                  width: 5,
                ),
                CircularProgressIndicator.adaptive(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
