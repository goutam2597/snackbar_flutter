import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

/// iPhone 17 Pro Max device frame for web demo
class DeviceFrame extends StatelessWidget {
  final Widget child;

  const DeviceFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Only show frame on web
    if (!kIsWeb) {
      return child;
    }

    return Center(
      child: Container(
        width: 430, // iPhone 17 Pro Max width
        height: 932, // iPhone 17 Pro Max height
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(55),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Device screen with rounded corners
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(47),
                  child: Navigator(
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => child,
                    ),
                  ),
                ),
              ),
            ),
            // Volume buttons (left side)
            Positioned(
              left: 0,
              top: 220,
              child: Container(
                width: 4,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 300,
              child: Container(
                width: 4,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                  ),
                ),
              ),
            ),
            // Power button (right side)
            Positioned(
              right: 0,
              top: 240,
              child: Container(
                width: 4,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
