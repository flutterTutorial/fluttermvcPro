import 'package:flutter/material.dart';
import 'package:mvm/res/component/app_color.dart';

class RoundButton extends StatelessWidget {
  final String? title;
  final bool? loading;
  final VoidCallback? onpresed;
  const RoundButton(
      {this.title, this.loading = false, this.onpresed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpresed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: loading!
              ? CircleAvatar()
              : Text(
                  title!,
                  style: TextStyle(color: AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}
