import 'package:flutter/material.dart';
import 'package:movie/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.grey,

      title: const Center(child: Text("All Movies", style: TextStyle(color: AppColors.green),)),


    );
  }
}
