import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "NotificationView",
          style: AppStyles.styleSemiBold24(),
        ),
      ),
    );
  }
}
