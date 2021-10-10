import 'package:card/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    required this.color,
    this.collapsed = false,
    Key? key,
  }) : super(key: key);

  final Color color;
  final bool? collapsed;

  Duration get duration => const Duration(seconds: 1);
  Curve get curve => Curves.elasticOut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Hero(
        tag: color.toString(),
        transitionOnUserGestures: true,
        child: Material(
          type: MaterialType.transparency,
          child: AnimatedContainer(
            duration: duration,
            curve: curve,
            height: collapsed! ? 100 : 200,
            width: MediaQuery.of(context).size.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(
                      milliseconds: duration.inMilliseconds - 300,
                    ),
                    curve: curve,
                    right: collapsed! ? 28 : 20,
                    top: collapsed! ? 32 : 20,
                    child: const Text(
                      'VISA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(
                      milliseconds: duration.inMilliseconds - 300,
                    ),
                    curve: curve,
                    left: collapsed! ? 28 : 20,
                    bottom: collapsed! ? 28 : 20,
                    child: const Text(
                      r'$32.922,23',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
