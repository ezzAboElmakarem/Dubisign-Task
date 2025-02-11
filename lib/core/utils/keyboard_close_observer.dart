import 'package:flutter/material.dart';

class KeyboardPopScaffold extends StatelessWidget {
  const KeyboardPopScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}

// import 'package:flutter/material.dart';

// class KeyboardCloseObserver extends StatefulWidget {
//   final Widget child;

//   const KeyboardCloseObserver({super.key, required this.child});

//   @override
//   _KeyboardCloseObserverState createState() => _KeyboardCloseObserverState();
// }

// class _KeyboardCloseObserverState extends State<KeyboardCloseObserver>
//     with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeMetrics() {
//     if (FocusManager.instance.primaryFocus?.context != null) {
//       FocusManager.instance.primaryFocus?.unfocus();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }
