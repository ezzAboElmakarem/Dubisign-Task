import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "FavouriteView",
          style: AppStyles.styleSemiBold24(),
        ),
      ),
    );
  }
}
